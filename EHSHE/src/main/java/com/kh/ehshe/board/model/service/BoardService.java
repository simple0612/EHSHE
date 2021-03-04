package com.kh.ehshe.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;

public interface BoardService {

	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getPageInfo(int cp);

	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<VBoard> selectList(PageInfo pInfo);

	/** 썸네일 목록 조회 Service
	 * @param bList
	 * @return thList
	 */
	public abstract List<Attachment> selectThumbnailList(List<VBoard> bList);
	
	/** 게시글 상세 조회 Service
	 * @param boardNo
	 * @param type 
	 * @return board
	 */
	public abstract VBoard selectBoard(int boardNo);

	/** 게시글 상세 조회 썸네일 Service 
	 * @param boardNo
	 * @return fList
	 */
	public abstract List<Attachment> selectAttachmentList(int boardNo);

	public abstract int insertBoard(Map<String, Object> map, List<MultipartFile> image, String thumbnailSavePath,
			String contentsavePath);

	public abstract Attachment insertImage(MultipartFile uploadFile, String savePath);

	public abstract int updateBoard(Board updateBoard, List<MultipartFile> image, String savePath, String cSavePath);

	/** 게시글 삭제 Service
	 * @param boardNo
	 * @return
	 */
	public abstract int deleteBoard(int boardNo);

	/** 검색 조건이 포함된 페이징 처리 객체 생성 Service
	 * @param cp
	 * @param map
	 * @return listCount
	 */
	public abstract PageInfo getPageInfo(int cp, Map<String, Object> map);

	/** 검색 조건이 포함된 게시글 목록 조회 Service
	 * @param pInfo
	 * @param map
	 * @return bList
	 */
	public abstract List<VBoard> selectSearchList(PageInfo pInfo, Map<String, Object> map);
	
}
