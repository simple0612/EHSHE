package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.ShopBuying;
import com.kh.ehshe.shop.model.vo.ShopReview;

@Repository
public class ShopReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 댓글 목록 조회 DAO
	 * 
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<ShopReview> selectReplyList(int itemNo) {
		return sqlSession.selectList("shopReviewMapper.selectReplyList", itemNo);
	}

	/*	*//**
			 * 댓글 삽입 DAO
			 * 
			 * @param map
			 * @return result
			 *//*
				 * public int insert(Map<String, Object> map) { return
				 * sqlSession.insert("ShopReviewMapper.insertReply", map); }
				 */

	/*	*//**
			 * 댓글 수정 DAO
			 * 
			 * @param reply
			 * @return result
			 */
	/*
	 * public int updateReply(ShopReview reply) { return
	 * sqlSession.update("ShopReviewMapper.updateReply",reply); }
	 * 
	 *//**
		 * 댓글 삭제 DAO
		 * 
		 * @param replyNo
		 * @return result
		 */
	/*
	 * public int deleteReply(int replyNo) { return
	 * sqlSession.update("ShopReviewMapper.deleteReply",replyNo); }
	 * 
	 *//**
		 * 대댓글 삽입 DAO
		 * 
		 * @param map
		 * @return result
		 *//*
			 * public int insertChildReply(Map<String, Object> map) { return
			 * sqlSession.insert("ShopReviewMapper.insertChildReply",map); }
			 */

	/**
	 * 옵션 상세번호 조회하기
	 * 
	 * @param map
	 * @return sblist
	 */
	public List<ShopBuying> selectOptionSpecifyNoList(Map<String, Object> map) {
		return sqlSession.selectList("shopReviewMapper.selectOptionSpecifyNoList", map);
	}
	
	/** 댓글등록
	 * @param map
	 * @return result
	 */
	  public int insertReview(Map<String, Object> map) { 
		  return sqlSession.insert("shopReviewMapper.insertReview", map); 
	  }

	  
	/** 댓글 업데이트
	 * @param reply
	 * @return
	 */public int updateReply(Map<String, Object> map) {
		  return sqlSession.update("shopReviewMapper.updateReview",map);
 
 }

	/** 
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.delete("shopReviewMapper.deleteReply",replyNo);
	}
	 

}
