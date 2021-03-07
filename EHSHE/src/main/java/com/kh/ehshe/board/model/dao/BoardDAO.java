package com.kh.ehshe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**	게시판 전체 게시글 수 조회 DAO
	 * 작성자 mang
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	
	/** 게시글 목록 조회 DAO
	 * 작성자 mang
	 * @param pInfo
	 * @return bList
	 */
	public List<VBoard> selectList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}


	/** 게시글 목록 썸네일 조회 DAO
	 * 작성자 mang
	 * @param bList
	 * @return thumbnailList
	 */
	public List<Attachment> selectThumbnailList(List<VBoard> bList) {
		return sqlSession.selectList("boardMapper.selectThumbnailList", bList);
	}


	/** 게시글 상세 조회 DAO
	 * 작성자 mang
	 * @param boardNo
	 * @return board
	 */
	public VBoard selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}


	/** 게시글 조회수 증가 DAO
	 * 작성자 mang
	 * @param boardNo
	 * @return result
	 */
	public int increaseReadCount(int boardNo) {
		return sqlSession.update("boardMapper.increaseReadCount", boardNo);
	}


	/** 게시글 이미지 목록 조회 DAO
	 * 작성자 mang
	 * @param boardNo
	 * @return attachmentList
	 */
	public List<Attachment> selectAttachmentList(int boardNo) {
		return sqlSession.selectList("boardMapper.selectAttachmentList", boardNo);
	}


	/** 게시글 다음 번호 조회 DAO
	 * 작성자 mang
	 * @return result
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("boardMapper.selectNextNo");
	}


	/** 게시글 삽입 DAO
	 * 작성자 mang
	 * @param map
	 * @return result
	 */
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("boardMapper.insertBoard", map);
	}


	/** 파일 정보 삽입 DAO
	 * 작성자 mang
	 * @param uploadImages
	 * @return result
	 */
	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("boardMapper.insertAttachmentList", uploadImages);
	}


	/** 게시글 수정  DAO
	 * 작성자 mang
	 * @param updateBoard
	 * @return result
	 */
	public int updateBoard(Board updateBoard) {
		return sqlSession.update("boardMapper.updateBoard", updateBoard);
	}


	/** 파일 정보 수정 DAO
	 * 작성자 mang
	 * @param at
	 * @return result
	 */
	public int updateAttachment(Attachment at) {
		return sqlSession.update("boardMapper.updateAttachment", at);
	}


	/** 파일 정보 삽입 DAO
	 *  작성자 mang
	 * @param at
	 * @return result
	 */
	public int insertAttachment(Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}
	
	/** 파일 정보 삭제 DAO
	 * 작성자 mang
	 * @param fileNo
	 * @return result
	 */
	public int deleteAttachment(int fileNo) {
		return sqlSession.delete("boardMapper.deleteAttachment", fileNo);
	}

	/** DB에 저장된 최근 3일 이내를 제외한 파일 정보 조회 DAO
	 * 작성자 mang
	 * @return dbFileList
	 */
	public List<String> selectDBFileList() {
		return sqlSession.selectList("boardMapper.selectDBFileList");
	}


	public int deleteBoard(int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}


	/** 검색조건에 맞는 게시글 수 조회 DAO
	 * 작성자 mang
	 * @param map
	 * @return listCount
	 */
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}


	public List<VBoard> selectSearchList(PageInfo pInfo, Map<String, Object> map) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}


	/** 파일 정보 일괄 삭제 DAO
	 * 작성자 mang
	 * @param deleteFileNoList
	 * @return result
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("boardMapper.deleteAttachmentList", deleteFileNoList);
	}


	/** 자신이 좋아요 한 글인지 조회 Service
    * @param map
    * @return likeFl
    */
   public int selectLikeFl(Map<String, Integer> map) {
      return sqlSession.selectOne("boardMapper.selectLikeFl", map);
   }

   
   /** 좋아요 삽입 DAO
    * @param map
    * @return result
    */
   public int insertLike(Map<String, Integer> map) {
      return sqlSession.insert("boardMapper.insertLike", map);
   }
 
   /** 좋아요 삭제 DAO
    * @param map
    * @return result
    */
   public int deleteLike(Map<String, Integer> map) {
      return sqlSession.delete("boardMapper.deleteLike", map);
   }

   /** 좋아요 카운트 DAO
    * @param boardNo
    * @return  result
    */
   public int selectLikeCount(int boardNo) {
      return sqlSession.selectOne("boardMapper.selectLikeCount", boardNo);
   }


}
