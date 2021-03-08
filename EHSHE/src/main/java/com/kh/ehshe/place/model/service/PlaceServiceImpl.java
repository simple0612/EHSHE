package com.kh.ehshe.place.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.board.model.exception.InsertAttachmentFailException;
import com.kh.ehshe.place.model.dao.PlaceDAO;
import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
import com.kh.ehshe.place.model.vo.VPlace;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	private PlaceDAO dao;
	
	@Override
	public PlacePageInfo getPlacePageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new PlacePageInfo(cp, listCount);
	}

	// 게시글 목록 조회 service 구현
	@Override
	public List<VPlace> selectList(PlacePageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 썸네일 목록 조회 Service 구현
	@Override
	public List<PAttachment> selectThumbnailList(List<VPlace> pList) {
		return dao.selectThumbnailList(pList);
	}
	
	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public VPlace selectPlace(int placeNo) {
		
		VPlace place = dao.selectPlace(placeNo);
		
		if(place != null) {
			int result = dao.increaseReadCount(placeNo);
			
			if (result > 0) { // DB 조회수 증가 성공 시
				// 먼저 조회된 board의 조회수도 1증가
				place.setReadCount(place.getReadCount() + 1);
			}
		}
		return place;
	}
	
	// 게시글 이미지 조회 Service 구현
	@Override
	public List<PAttachment> selectAttachmentList(int placeNo) {
		return dao.selectAttachmentList(placeNo);
	}

	// 게시글 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertPlace(Map<String, Object> map, List<MultipartFile> image, String thumbnailSavePath,
			String contentsavePath) {
		
		int result = 0;
		
		int placeNo = dao.selectNextNo();
		
		if(placeNo > 0) {
			map.put("placeNo", placeNo);
			
			// 관리자만 게시 가능한 글이므로 스크립트 방지처리 x( 사용할수 있도록 함 )
			result = dao.insertPlace(map);
			
			if(result > 0) {
				List<PAttachment> uploadImages = new ArrayList<PAttachment>();
				
				String filePath = "/resources/placeImages";
				
				for(int i=0; i<image.size(); i++) {
					if (!image.get(i).getOriginalFilename().equals("")) {

						// 원본 파일명 변경
						String fileName = rename(image.get(i).getOriginalFilename());
						// Attachment 객체 생성
						PAttachment at = new PAttachment(filePath, fileName, i, placeNo);

						uploadImages.add(at); // 리스트에 추가
					}
				}
				
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식

				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher((String) map.get("placeContent"));

				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수

				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우
				// true
				while (matcher.find()) {
					src = matcher.group(1); // 매칭된 src 속성값을 Matcher 객체에서 꺼내서 src에 저장

					String contentFilePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.

					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.

					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					PAttachment at = new PAttachment(filePath , fileName, 1, placeNo);
					uploadImages.add(at);
				}
				// -------------------------------------------------------
				
				if (!uploadImages.isEmpty()) {
					// 파일 정보 삽입 DAO 호출
					result = dao.insertAttachmentList(uploadImages);
					// result == 삽입된 행의 개수

					System.out.println(result);	
					System.out.println(uploadImages);	
					
					// 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
					if (result == uploadImages.size()) {
						result = placeNo; // result에 boardNo 저장

						// MultipartFile.transferTo()
						// -> MultipartFile 객체에 저장된 파일을
						// 지정된 경로에 실제 파일의 형태로 변환하여 저장하는 메소드

//						int tSize = uploadImages.size();
						int tSize = image.size();
//
//						if (image.get(0).getOriginalFilename().equals("")) {
//							int cSize = image.size();
//						}
						
						for (int i=0; i<tSize; i++) {
							// uploadImages : 업로드된 이미지 정보를 담고 있는 Attachment가 모여있는 List
							// image : input type="file" 태그의 정보를 담은 MultpartFile이 모여있는 List

							// uploadImages를 만들 때 각 요소의 파일 레벨은 images의 index를 이용하여 부여함.

							try {
								if(uploadImages.get(i).getFileLevel() != 0) break;
								
								image.get(uploadImages.get(i).getFileLevel())
										.transferTo(new File(contentsavePath + "/" + uploadImages.get(i).getFileName()));
							} catch (Exception e) {
								e.printStackTrace();

								// transferTo() 는 IOException을 발생 시킴(CheckedException)
								// -> 어쩔 수 없이 try-catch 작성
								// --> 예외가 처리되버려서 @Transactional이 정상 동작하지 못함
								// --> 꼭 예외처리를 하지 않아도 되는 UncheckedException을 강제 발생하여
								// @Transactional이 예외가 발생했음을 감지하게 함
								// --> 상황에 맞는 사용자 정의 예외를 작성
								throw new InsertAttachmentFailException("파일 서버 저장 실패");
							}
						}
					} else { // 파일 정보를 DB에 삽입하는데 실패했을 때
						throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
					}
				} else { // 업로드된 이미지가 없을 경우
					result = placeNo;
				}
			}
			return result;
		}
		return placeNo;
	}

	@Override
	public PAttachment insertImage(MultipartFile uploadFile, String cSavePath) {
		// 파일명 변경
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String contentFilePath = "/resources/placeImages";

		PAttachment at = new PAttachment();
		at.setFilePath(contentFilePath);
		at.setFileName(fileName);

		// 서버에 파일 저장 ( transferTo )
		try {
			uploadFile.transferTo(new File(cSavePath + "/" + fileName));

		} catch (Exception e) {
			e.printStackTrace();

			throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
		}
		return at;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);
		// String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}
	
	// place 게시글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deletePlace(int placeNo) {
		int result = dao.deletePlace(placeNo);
		
		return result;
	}

	// 즐겨찾기 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertScrap(Map<String, Integer> map) {
		return dao.insertScrap(map);
	}

	// 즐겨찾기 취소 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteScrap(Map<String, Integer> map) {
		return dao.deleteScrap(map);
	}

	// 즐겨찾기 수 카운트 Service 구현
	@Override
	public int selectScrapCount(int placeNo) {
		return dao.selectScrapCount(placeNo);
	}

	// 자신이 즐겨찾기한 글인지 조회 Service 구현
	@Override
	public int selectScrapFl(Map<String, Integer> map) {
		return dao.selectScrapFl(map);
	}
	
}
