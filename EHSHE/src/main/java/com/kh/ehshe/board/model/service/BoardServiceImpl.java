package com.kh.ehshe.board.model.service;

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

import com.kh.ehshe.board.model.dao.BoardDAO;
import com.kh.ehshe.board.model.exception.InsertAttachmentFailException;
import com.kh.ehshe.board.model.exception.UpdateAttachmentFailException;
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;

	// 게시판 전체 게시글수 조회 Service 구현
	@Override
	public PageInfo getPageInfo(int cp) {

		int listCount = dao.getListCount();

		return new PageInfo(cp, listCount);
	}

	// 게시글 목록 조회 service 구현
	@Override
	public List<VBoard> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> selectThumbnailList(List<VBoard> bList) {
		return dao.selectThumbnailList(bList);
	}

	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public VBoard selectBoard(int boardNo) {

		VBoard board = dao.selectBoard(boardNo);

		if (board != null) {
			int result = dao.increaseReadCount(boardNo);

			if (result > 0) { // DB 조회수 증가 성공 시
				// 먼저 조회된 board의 조회수도 1증가
				board.setReadCount(board.getReadCount() + 1);
			}
		}

		return board;
	}

	// 게시글 이미지 조회 Service 구현
	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return dao.selectAttachmentList(boardNo);
	}

	// 게시글 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Map<String, Object> map, List<MultipartFile> image, String thumbnailSavePath,
			String contentsavePath) {

		int result = 0;
		
		int boardNo = dao.selectNextNo();

		if (boardNo > 0) {

			map.put("boardNo", boardNo);

			// 제목 부분 크로스 사이트 스크립팅 방지
			String boardTitle = (String) map.get("boardTitle");
			String categoryName = (String) map.get("categoryName");
			String boardLocation = (String) map.get("boardLocation");
			boardTitle = replaceParameter(boardTitle);
			categoryName = replaceParameter(categoryName);
			boardLocation = replaceParameter(boardLocation);

			map.put("boardTitle", boardTitle);
			map.put("categoryName", categoryName);
			map.put("boardLocation", boardLocation);

			// 게시글 삽입 DAO 메소드 호출
			result = dao.insertBoard(map);

			// 게시글 삽입 성공 시 이미지 정보 삽입
			if (result > 0) {

				List<Attachment> uploadImages = new ArrayList<Attachment>();

				String filePath = "/resources/infoImages";

				// for문을 이용하여 파일정보가 담긴 image를 반복 접근
				// -> 업로드된 파일이 있을 경우에만 uploadImages 리스트에 추가
				for (int i = 0; i < image.size(); i++) {

					// 현재 접근한 image의 요소(MultipartFile)에 업로드된 파일이 있는지 확인
					if (!image.get(i).getOriginalFilename().equals("")) {

						// 원본 파일명 변경
						String fileName = rename(image.get(i).getOriginalFilename());
						// Attachment 객체 생성
						Attachment at = new Attachment(filePath, fileName, i, boardNo);

						uploadImages.add(at); // 리스트에 추가
					}
				}

				// ---------------------------------- summernote -----------------------------
				// boardContent 내부에 업로드된 이미지 정보(filePath, fileName) 이 들어있음
				// -> boardContent에서 <img> 태그만을 골라내어
				// img 태그의 src 속성 값을 추출 후 filePath, fileName을 얻어냄
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식

				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher((String) map.get("boardContent"));

				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수

				// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우
				// true
				while (matcher.find()) {
					src = matcher.group(1); // 매칭된 src 속성값을 Matcher 객체에서 꺼내서 src에 저장

					String contentFilePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.

					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.

					// Attachment 객체를 이용하여 DB에 파일 정보를 저장
					Attachment at = new Attachment(filePath, contentFilePath, fileName, 1, boardNo);
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
						result = boardNo; // result에 boardNo 저장

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
					result = boardNo;
				}
			}
			return result;
		}
		return boardNo;
	}

	// 크로스 사이트 스크립팅 방지 메소드
	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}

		return result;
	}

	// 파일명 변경 메소드
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

	// summernote 업로드 이미지 저장 Service 구현
	@Override
	public Attachment insertImage(MultipartFile uploadFile, String cSavePath) {

		// 파일명 변경
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String contentFilePath = "/resources/infoImages";

		Attachment at = new Attachment();
		at.setContentFilePath(contentFilePath);
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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(Board updateBoard, List<MultipartFile> image, String tSavePath, String cSavePath) {

		// 제목, 내용 크로스사이트 스크립팅 방지 처리
		updateBoard.setBoardTitle(replaceParameter(updateBoard.getBoardTitle()));
		updateBoard.setBoardContent(replaceParameter(updateBoard.getBoardContent()));

		// 게시글 수정 DAO 호출
		int result = dao.updateBoard(updateBoard);

		// 2) 이미지 수정(난이도 * X 100)
		if (result > 0) {

			// 수정 전 업로드 되어있던 파일 정보를 얻어옴.
			// -> 새롭게 삽입 또는 수정되는 파일과 비교하기 위함.
			List<Attachment> oldFiles = dao.selectAttachmentList(updateBoard.getBoardNo());

			// 새로 업로드도니 파일 정보를 담을 리스트
			List<Attachment> uploadImages = new ArrayList<Attachment>();

			// 삭제 되어야할 파일 정보를 담은 리스트
			List<Attachment> removeFileList = new ArrayList<Attachment>();

			// DB에 저장할 웹상 이미지 접근 경로
			String thumbnailFilePath = "/resources/uploadImages";

			String contentFilePath = "/resources/infoImages";

			// 새롭게 업로드된 파일 정보를 가지고 있는 images에 접근
			for (int i = 0; i < image.size(); i++) {

				// 업로드된 이미지가 있을 경우
				if (!image.get(i).getOriginalFilename().equals("")) {

					// 파일명 변경
					String fileName = rename(image.get(i).getOriginalFilename());

					// Attachment 객체 생성
					Attachment at = new Attachment(thumbnailFilePath, contentFilePath, fileName, i,
							updateBoard.getBoardNo());

					uploadImages.add(at); // 업로드 이미지 리스트에 추가

					// true : update 진행
					// false : insert 진행
					boolean flag = false;

					// 새로운 파일 정보와 이전 파일 정보를 비교하는 반복문
					for (Attachment old : oldFiles) {

						if (old.getFileLevel() == i) {
							// 현재 접근한 이전 파일의 레벨이
							// 새롭게 업로드한 파일의 레벨과 같은 경우
							// == 같은 레벨에 새로운 이미지 업로드 --> update 진행
							flag = true;

							// DB에서 파일 번호가 일치하는 행의 내용을 수정하기 위해 파일번호를 얻어옴.
							at.setFileNo(old.getFileNo());

							removeFileList.add(old); // 삭제할 파일 목록에 이전 파일 정보 추가
						}
					}
					// flag 값에 따른 insert / update 제어
					if (flag) { // true : update 진행
						result = dao.updateAttachment(at);

					} else { // false : insert 진행
						result = dao.insertAttachment(at);
					}

					// insert 또는 update 실패 시 rollback 수행
					// -> 예외를 발생 시켜서 @Transactional을 이용해 수행
					if (result <= 0) {
						throw new UpdateAttachmentFailException("파일 정보 수정 실패");
					}
				} else { // 업로드된 이미지가 없을 경우

					for (Attachment old : oldFiles) {

						// x버튼으로 삭제가 되었다고 deleteImages에 true로 저장되어 있지만
						// 혹시라도 이미지가 없는데 x버튼을 누른걸 수도 있으니
						// 진짜로 이전 이미지가 있었는지 검사
						if (old.getFileLevel() == 1) {

							result = dao.deleteAttachment(old.getFileNo());

							if (result > 0) { // 삭제 성공 시
								// removeFileList : 서버에서 삭제할 파일의 정보를 모아둔 리스트
								removeFileList.add(old); // 서버 파일 삭제 리스트에 추가

							} else { // 삭제 실패 시
								throw new UpdateAttachmentFailException("파일 정보 삭제 실패");
							}
						}
					}
				}

			} // image 반복 접근 for문 종료

			// uploadImages == 업로드된 파일 정보 --> 서버에 파일 저장
			// removeFileList == 제거해야될 파일 정보 --> 서버에서 파일 삭제
			// 수정되거나 새롭게 삽입된 이미지를 서버에 저장하기 위해 transferTo() 수행
			if (result > 0) {
				for (int i = 0; i < uploadImages.size(); i++) {

					try {
						image.get(uploadImages.get(i).getFileLevel())
								.transferTo(new File(tSavePath + "/" + uploadImages.get(i).getFileName()));
					} catch (Exception e) {
						e.printStackTrace();
						throw new UpdateAttachmentFailException("파일 정보 수정 실패");
					}
				}
			}

			// ------------------------------------------
			// 이전 파일 서버에서 삭제하는 코드
			for (Attachment removeFile : removeFileList) {
				File tmp = new File(tSavePath + "/" + removeFile.getFileName());
				tmp.delete();
			}
			// ------------------------------------------
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(int boardNo) {
		int result = dao.deleteBoard(boardNo);
		
		return result;
	}
	
	// 검색 조건이 포함된 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo getPageInfo(int cp, Map<String, Object> map) {
		
		// 검색 조건에 맞는 게시글 수 조회
		int listCount = dao.getSearchListCount(map);
		
		return new PageInfo(cp, listCount);
	}

	@Override
	public List<VBoard> selectSearchList(PageInfo pInfo, Map<String, Object> map) {
		return dao.selectSearchList(pInfo, map);
	}

}
