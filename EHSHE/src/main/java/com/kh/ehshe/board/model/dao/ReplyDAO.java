package com.kh.ehshe.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.board.model.vo.VBReply;
import com.kh.ehshe.board.model.vo.BReply;

@Repository// 저장소 관련 + Bean 등록
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentBoardNo
	 * @return rList
	 */
	public List<VBReply> selectReplyList(int parentBoardNo) {
		return sqlSession.selectList("bReplyMapper.selectReplyList", parentBoardNo);
	}

	/** 댓글 삽입 DAO
	 * @param map
	 * @return result 
	 */
	public int insertReply(Map<String, Object> map) {
		return sqlSession.insert("bReplyMapper.insertReply", map);
	}

	/** 댓글 수정 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(BReply reply) {
		return sqlSession.update("bReplyMapper.updateReply", reply);
	}

	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("bReplyMapper.deleteReply", replyNo);
	}

	/** 대댓글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertChildReply(Map<String, Object> map) {
		return sqlSession.insert("bReplyMapper.insertChildReply", map);
	}
}
