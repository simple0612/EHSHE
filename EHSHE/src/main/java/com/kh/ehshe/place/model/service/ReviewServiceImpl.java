package com.kh.ehshe.place.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.place.model.dao.ReviewDAO;
import com.kh.ehshe.place.model.vo.PReview;
import com.kh.ehshe.place.model.vo.VPReview;

@Service // Service + Bean등록
public class ReviewServiceImpl implements ReviewService{

	@Autowired // 등록된 Bean 중 타입이 일치하는 Bean을 자동으로 의존성 주입
	private ReviewDAO dao;

	// 댓글 목록 조회 Service 구현
	@Override
	public List<VPReview> selectReviewList(int parentPlaceNo) {
		return dao.selectReviewList(parentPlaceNo);
	}
	
	// 댓글 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(Map<String, Object> map) {
		
		// 크로스 사이트 스크립팅 방지
		map.put("reviewContent", replaceParameter( (String)map.get("reviewContent")) );
		
		// ajax로 textarea 내용을 얻어올 경우 개행문자가 \n으로 취급됨.
		// 개행문자 처리 \n -> <br>
		map.put("reviewContent", ((String)map.get("reviewContent")).replaceAll("\n", "<br>") );

		return dao.insertReview(map);
	}
	
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReview(PReview review) {
		
		// 크로스 사이트 스크립팅 처리
		review.setReviewContent(replaceParameter(review.getReviewContent()) );
		// 개행문자 처리
		review.setReviewContent(review.getReviewContent().replaceAll("\n", "<br>") );
		
		return dao.updateReview(review);
	}
	
	// 댓글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(int reviewNo) {
		
		return dao.deleteReview(reviewNo);
	}

	
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
}
