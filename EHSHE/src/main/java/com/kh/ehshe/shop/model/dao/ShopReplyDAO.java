package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.ShopReply;

@Repository
public class ShopReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<ShopReply> selectReplyList(int parentBoardNo) {
		return sqlSession.selectList("replyMapper.selectReplyList",parentBoardNo);
	}

	/** 댓글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("replyMapper.insertReply",map);
	}

	/** 댓글 수정 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(ShopReply reply) {
		return sqlSession.update("replyMapper.updateReply",reply);
	}

	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("replyMapper.deleteReply",replyNo);
	}

	/** 대댓글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertChildReply(Map<String, Object> map) {
		return sqlSession.insert("replyMapper.insertChildReply",map);
	}

	/*
	 * public int updateReply(Map<String, Object> map) { return
	 * sqlSession.update("replyMapper.updateReply",map); }
	 */
	

	
	
}
