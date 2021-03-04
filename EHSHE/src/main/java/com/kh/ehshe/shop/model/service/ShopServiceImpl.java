package com.kh.ehshe.shop.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.shop.model.Exception.InsertShopAttachmentFailException;
import com.kh.ehshe.shop.model.Exception.UpdateShopAttachmentFailException;
import com.kh.ehshe.shop.model.dao.ShopDAO;
import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopOption;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;
import com.kh.ehshe.shop.model.vo.ShopScore;

@Service
public class ShopServiceImpl implements ShopService {
	
	
	@Autowired
	private ShopDAO dao;
	
	
	@Override
	public ShopPageInfo getPageInfo(int type, int cp) {

		int listCount = dao.getListCount(type);
		
		
		return new ShopPageInfo(cp,listCount,type);
	}

	// shop 게시글 목록 조회 Service 구현
	@Override
	public List<Shop> selectShopList(ShopPageInfo pInfo) {
		
		return dao.selectShopList(pInfo);
	}
	
	//  썸네일 목록 조회 Service 구현
	@Override
	public List<ShopAttachment> selectShopThumbnailList(List<Shop> sList) {
		return dao.selecShopThumbnailList(sList);
	}
	
	
	// shop 게시글 상세조회 Service 구현
	@Override
	public Shop selectShopBoard(int itemNo, int type) {
		
		Shop temp =new Shop();
		temp.setItemNo(itemNo);
		temp.setItemCategory(type);
		
		Shop shop =dao.selectShopBoard(temp);
		
			
		
		return shop;
	}
	
	// shop에 option 조회 Service 구현
	@Override
	public List<ShopOption> selectShopOptionList(int itemNo) {
		return dao.selectShopOptionList(itemNo);
	}
	
	// shop에 포함된 이미지 목록 조회 Service 구현
	@Override
	public ShopAttachment selectShopAttachmentList(int itemNo) {
		return dao.selectShopAttachmentList(itemNo);
	}

	
	// shop 게시글 삽입 Service 구현
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertShop(Map<String, Object> map, List<MultipartFile> images, String savePath,
							List<String> sizemenu, List<String> colormenu) {
		
		int result = 0;
	
		int optionInsert = 0;
		int shopOptionNo = 0;
		int shopNo = dao.selectShopNextNo();
		
		if(shopNo > 0) {
			
			map.put("shopNo", shopNo); 
			
			result = dao.insertShopBoard(map); 

			if(result > 0) {
				
		      	optionInsert = dao.insertOption(shopNo); // 옵션 번호 및 상품번호 추가
				
				if(optionInsert > 0) {
					
					shopOptionNo = dao.selectOptionNextNO(shopNo); // 옵션번호 조회하기
					
					List<ShopOption> shopOption = new ArrayList<ShopOption>(); 
					
					String optionDetail =null;
					String optionColor =null;
					String optionSize = null;
					
					for (int i = 0; i < sizemenu.size(); i++) {

						 optionSize = sizemenu.get(i);
						
						 for (int j = 0; j < colormenu.size(); j++) {

							 optionColor = colormenu.get(j);
							 optionDetail = optionSize +"("+optionColor+")";
							
							 ShopOption opd = new ShopOption(shopOptionNo,optionDetail);
							 
							 shopOption.add(opd);
							}

					}
					
					int insertOptionDetail = dao.insertOptionDeatail(shopOption);
					
					System.out.println("옵션디테일삽입 성공 : "+insertOptionDetail);
				}
				
				
				
				List<ShopAttachment> uploadImages = new ArrayList<ShopAttachment>(); 

				String filePath = null;
				
				if((int)map.get("shopCategory")==1) {
					filePath ="/resources/clothesImages";
					
				}else if((int)map.get("shopCategory")==2) {
					filePath ="/resources/accessoryImages";
				}else if((int)map.get("shopCategory")==3) {
					filePath ="/resources/etcImages";
				}
				
				
				for(int i=0; i<images.size(); i++) {
				
					 if(!images.get(i).getOriginalFilename().equals("")) {
						 
						 String fileName = rename(images.get(i).getOriginalFilename());
						 
						 ShopAttachment at = new ShopAttachment(fileName,filePath,i,shopNo);
						 
						 uploadImages.add(at);
					 }
					
				}
				
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
				
				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher((String)map.get("shopContent"));     
				 
				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수
				
				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
				while(matcher.find()){
					src=  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
					
					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
					
					fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
					
					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					ShopAttachment at = new ShopAttachment(fileName, filePath, 1, shopNo);
					uploadImages.add(at);
				}
			
			
			
				if(!uploadImages.isEmpty()) {
				
				result = dao.insertShopAttachmentList(uploadImages);
				if(result == uploadImages.size()) {
					
					result = shopNo; 
					
					int size = 0;
					
				    if(!images.get(0).getOriginalFilename().equals("")){
						size = images.size();
					}
					
					
					for(int i =0; i<size; i++) {
						
							try {
								images.get(uploadImages.get(i).getFileLevel())
								.transferTo(new File(savePath +"/"+uploadImages.get(i).getFileName()));
								
								
								
							}catch(Exception e) {
							  e.printStackTrace();
							  
							  
							throw new InsertShopAttachmentFailException("파일 서버 저장 실패");
						
							}
							
						
						}
					
				}else{ // 파일 정보를 DB에 삽입하는데 실패했을 때
					
					throw new InsertShopAttachmentFailException("파일 정보 DB 삽입 실패");

					
				}
				
			}
			
		}
		
		
	}
		return result;
	
}
	
	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}


	// summernote 업로드 이미지 저장 Servic
	@Override
	public ShopAttachment insertShopImage(MultipartFile uploadFile, String savePath,int type) {
		
		String fileName = rename(uploadFile.getOriginalFilename());
		
		
		String filePath = null;
		if(type == 1) {
			 filePath = "/resources/clothesImages";
		}else if(type == 2) {
			 filePath = "/resources/accessoryImages";
		}else {
			 filePath = "/resources/etcImages";
		}

		ShopAttachment at = new ShopAttachment();
		at.setFilePath(filePath);
		at.setFileName(fileName);
		
		try {
		 uploadFile.transferTo(new File(savePath+ "/" +fileName));

		}catch(Exception e) {
				e.printStackTrace();
			throw new InsertShopAttachmentFailException("summernote 파일 업로드 실패");
			
			
		}
		
		
		
		return at;
	}

	// shop 게시글 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateShopBoard(Shop updateShopBoard, MultipartFile images, String savePath) {
	
		updateShopBoard.setItemNm(replaceParameter(updateShopBoard.getItemNm()));
		
		int result = dao.updateShopBoard(updateShopBoard);

		if(result > 0) {
			
			String filePath = null;
			
			ShopAttachment oldFile = dao.selectShopAttachmentList(updateShopBoard.getItemNo());
			ShopAttachment uploadImages = new ShopAttachment();
			ShopAttachment removeFile = new ShopAttachment();
			
			
			if(updateShopBoard.getItemCategory() ==1) {
				filePath = "/resources/clothesImages";
			}else if(updateShopBoard.getItemCategory() ==2){
				filePath = "/resources/accessoryImages";
			}else{
				filePath = "/resources/etcImages";
			}
			
			
			if(!images.getOriginalFilename().equals("")) {

				
				String fileName = rename(images.getOriginalFilename());
				
				ShopAttachment at = new ShopAttachment(updateShopBoard.getItemNo(),fileName, filePath, 0, updateShopBoard.getItemNo());
				at.setFileNo(oldFile.getFileNo());
				
				System.out.println("파일수정정보at" + at);
			    result = dao.updateShopAttachment(at);
			    System.out.println("파일수정행: " +result);
			
			if(result<=0) {
				throw new UpdateShopAttachmentFailException("파일 정보 수정 실패");
			}

		
			if(result > 0) {
				try {
					images
					.transferTo(new File(savePath+"/"+at.getFileName()));
					
				}catch(Exception e) {
					e.printStackTrace();
					throw new UpdateShopAttachmentFailException("파일 정보 수정 실패");
					
				}
			
			}
			
			File tmp = new File(savePath + "/" + oldFile.getFileName());
			tmp.delete();
		
			}
			
			// 1) summernote로 작성된 게시글  부분 수정
			// 2) 썸네일 이미지 수정
			// 3) summernote로 작성된 게시글 에있는 이미지 정보 수정
			// -> 게시글 내부 <img> 태그의 src 속성을 얻어와 파일명을 얻어옴.
			// -> 수정 전 게시글의 이미지와  수정 후  게시글 이미지  파일명을 비교
			// --> 새롭게 추가된 이미지, 기존 이미지에서 삭제된 것도 존재
			// --> Attachment 테이블에 반영
			List<ShopAttachment> oldFiles = dao.selectShopSummernoteImg(updateShopBoard.getItemNo());

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
			
			// 게시글에 작성된 <img> 태그의 src속성을 이용해 
			Matcher matcher = pattern.matcher(updateShopBoard.getItemContent());
			
			// 정규식을 통해 게시글에 작성된 이미지 파일명만 얻어와 모아둘 List 선언
			List<String> fileNameList = new ArrayList<String>();
			
			String src = null; //  matcher에 저장된 src를 꺼내서 임시 저장할 변수
			String fileName = null; //src에서 파일명을 추출해서 임시 저장할 변수
			
			while(matcher.find()) {
				src = matcher.group(1); // /ehshe/shop/resources/clothes/abc.jpg
				fileName =src.substring(src.lastIndexOf("/")+1); // abc.jpg
				fileNameList.add(fileName);
			}
			
			// DB에 새로 추가할 이미지파일 정보를 모아둘 List 생성
			List<ShopAttachment> newShopAttachmentList = new ArrayList<ShopAttachment>();
			
			// DB에서 삭제할 이미지 파일 번호를 모아둘 LIST 생성
			List<Integer> deleteFileNoList = new ArrayList<Integer>();
			
			
			
			// 수정된 게시글 파일명 목록(fileNameList)와
			// 수정 전 파일 정보 목록(oldFiles)를 비교해서
			// 수정된 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순차적 비교를 진행
			// --> 수정된 게시글 파일명과 일치하는 수정 전 파일명이 없다면
			//    == 새로 삽입된 이미지임을 의미함.
			
			for(String fName : fileNameList) {
				
				boolean flag = true;
				
				
				for(ShopAttachment oldAt : oldFiles) {
					
					if(oldAt.getFileLevel() == 0) continue;
					
					if(fileName.equals(oldAt.getFileName())) { // 수정 후 / 수정 전 같은 파일이 있다.== 수정되지 않았다.
						flag = false;
						break;
					}
				}
				
				// flag == true ==  수정 후 게시글 파일명과 수정전 파일명이 일치하는게 없을 경우
				// == 새로운 이미지 --> newShopAttachmentList 추가
				if(flag) {
					ShopAttachment at = new ShopAttachment(fName,filePath,1,updateShopBoard.getItemNo());
					newShopAttachmentList.add(at);
				}
				
			}
			
			
			// 수정전 게시글 파일명 목록(oldFlies)와
			// 수정된 파일 정보 목록(fileNameList)를 비교해서
			// 수정전 게시글 파일명 하나를 기준으로 하여 수정 후 파일명과 순차적 비교를 진행
			// --> 수정 전 게시글 파일명과 일치하는 수정 후 파일명이 없다면
			//    == 기존 수정 전 이미지가 삭제함을 의미 
			for(ShopAttachment oldAt : oldFiles) {
				
				if(oldAt.getFileLevel() == 0) continue;
				
				boolean flag = true;
				
				for(String fName : fileNameList) {
					if(oldAt.getFileName().equals(fName)) {
						flag =  false;
						break;
					}
				}
				
				// flag == true ==  수정 전 게시글 파일명과 수정 후  파일명이 일치하는게 없을 경우
				// == 삭제된 이미지 --> deleteFileNoList 추가
				if(flag){
					deleteFileNoList.add(oldAt.getFileNo());
					
				}
				
			}
		  //newShopAttachmentList / deleteFileNoList 완성됨
			
			if(!newShopAttachmentList.isEmpty()) { //새로 삽입된 이미지가 있다면
				result = dao.insertShopAttachmentList(newShopAttachmentList);
				
				if(result != newShopAttachmentList.size()) { // 삽입된 결과행의 수와 삽입을 수행한 리스트 수가 맞지 않을 경우 == 실패
					throw new InsertShopAttachmentFailException("파일 수정 실패(파일 정보 삽입 중 오류 발생)");
				}
			}
			
			if(!deleteFileNoList.isEmpty()){ // 삭제할 이미지가 있다면
				result = dao.deleteShopAttachmentList(deleteFileNoList);
			
			
				if(result != deleteFileNoList.size()) {
					throw new InsertShopAttachmentFailException("파일 수정 실패(파일 정보 삭제 중 오류 발생)");
					
				}
			
			}
			
		}
		
		
		return result;
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}

	// 메인 페이지 최근순 조회하기
	@Override
	public List<Shop> selectShopMainList() {
		return dao.selectShopMainList();
	}

	// 메인페이지 최근순 썸네일 조회하기
	@Override
	public List<ShopAttachment> selectMainAttachmentlList(List<Shop> sList) {
		return dao.selectMainAttachmentlList(sList);
	}

	// 리스트 화면 별점 조회하기
	@Override
	public List<ShopScore> selectStarRation(List<Shop> sList) {
		return dao.selectStarRatingList(sList);
	}


	
	

}
