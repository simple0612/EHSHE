package com.kh.ehshe.place.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.board.model.vo.VBReply;
import com.kh.ehshe.place.model.vo.PReview;
import com.kh.ehshe.place.model.vo.VPReview;
import com.kh.ehshe.board.model.vo.BReply;

@Repository// 저장소 관련 + Bean 등록
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param parentPlaceNo
	 * @return rList
	 */
	public List<VPReview> selectReviewList(int parentPlaceNo) {
		return sqlSession.selectList("pReviewMapper.selectReviewList", parentPlaceNo);
	}

	/** 댓글 삽입 DAO
	 * @param map
	 * @return result 
	 */
	public int insertReview(Map<String, Object> map) {
		return sqlSession.insert("pReviewMapper.insertReview", map);
	}

	/** 댓글 수정 DAO
	 * @param review
	 * @return result
	 */
	public int updateReview(PReview review) {
		return sqlSession.update("pReviewMapper.updateReview", review);
	}

	/** 댓글 삭제 DAO
	 * @param reviewNo
	 * @return result
	 */
	public int deleteReview(int reviewNo) {
		return sqlSession.update("pReviewMapper.deleteReview", reviewNo);
	}

}
