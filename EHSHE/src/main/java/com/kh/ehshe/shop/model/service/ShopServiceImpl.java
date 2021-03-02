package com.kh.ehshe.shop.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.shop.model.Exception.InsertShopAttachmentFailException;
import com.kh.ehshe.shop.model.dao.shopDAO;
import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;

@Service
public class ShopServiceImpl implements ShopService {
	
	
	@Autowired
	private shopDAO dao;
	
	
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
	
	
	// shop에 포함된 이미지 목록 조회 Service 구현
	@Override
	public ShopAttachment selectShopAttachmentList(int itemNo) {
		return dao.selectShopAttachmentList(itemNo);
	}

	
	// shop 게시글 삽입 Service 구현
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertShop(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		
		int result = 0;
		
		int shopNo = dao.selectShopNextNo();
		
		if(shopNo > 0) {
			
			map.put("shopNo", shopNo); 

			
			result = dao.insertShopBoard(map);

			if(result > 0) {
				
				List<ShopAttachment> uploadImages = new ArrayList<ShopAttachment>(); 

				String filePath = null;
				
				if((int)map.get("shopCategory") ==1) {
					filePath ="/resources/clothesImages";
					
				}else if((int)map.get("shopCategory") ==2) {
					filePath ="/resources/accessoryImages";
				}else if((int)map.get("shopCategory") ==3) {
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
				System.out.println("나야나"+uploadImages);
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



	
	

}
