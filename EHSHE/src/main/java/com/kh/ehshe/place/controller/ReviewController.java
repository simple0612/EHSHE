package com.kh.ehshe.place.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ehshe.place.model.service.ReviewService;
import com.kh.ehshe.place.model.vo.PReview;
import com.kh.ehshe.place.model.vo.VPReview;

// RestController : Controller 내부에 작성도니 메소드의 반환 값이 모두 viewName이 아닌 값 자체인 Controller

//@Controller // 컨트롤러 + Bean 등록
@RestController // 값 자체만 반환하는 컨트롤러 + Bean 등록
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	// 댓글 목록 조회 Controller 
	//@ResponseBody // 반환되는 값을  viewName이 아니라 값 자체로 인식 시키는 어노테이션
	@RequestMapping("selectReviewList/{parentPlaceNo}")
	public String selectReviewList(@PathVariable("parentPlaceNo") int parentPlaceNo) {
		
		List<VPReview> rList = service.selectReviewList(parentPlaceNo);
		
		// JSON : 자바스크립트 객체 표기법 모양으로 작성된 문자열
		// GSON : Google에서 만든 JSON 라이브러리
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	// AJAX : 비동기로 통신하여 화면 전체 갱신 X 화면 일부 갱신 O
	
	// 댓글 삽입 Controller
	@RequestMapping("insertReview/{parentPlaceNo}")
	public int insertReview(@PathVariable("parentPlaceNo") int parentPlaceNo,
							@RequestParam("reviewWriter") int reviewWriter,
							@RequestParam("starRate") int starRate,
							String reviewContent) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentPlaceNo",parentPlaceNo);
		map.put("reviewWriter",reviewWriter);
		map.put("reviewContent",reviewContent);
		map.put("starRate", starRate);
		
		int result = service.insertReview(map);
		
		return result;
	}
	
	// 댓글 수정 Controller
	@RequestMapping("updateReview/{reviewNo}")
	public int updateReview(@PathVariable("reviewNo") int reviewNo, 
							/*String replyContent*/
							@ModelAttribute PReview review) {
		
		review.setReviewNo(reviewNo);
		// 커맨드 객체(updateReply)를 이용하여 replyContent를 전달받고,
		// @PathVariable을 통해 얻어온 replyNo를 커맨드 객체에 세팅하여 재활용
		
		return service.updateReview(review);
	}
	
	// 댓글 삭제 Controller
	@RequestMapping("deleteReview/{reviewNo}")
	public int deleteReview(@PathVariable("reviewNo") int reviewNo) {
		
		return service.deleteReview(reviewNo);
	}
	
	
}
