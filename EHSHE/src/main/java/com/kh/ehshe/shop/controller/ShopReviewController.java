package com.kh.ehshe.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ehshe.shop.model.service.ShopReviewService;
import com.kh.ehshe.shop.model.vo.ShopBuying;
import com.kh.ehshe.shop.model.vo.ShopReply;
import com.kh.ehshe.shop.model.vo.ShopReview;

@RestController // 값 자체만 반환하는 컨트롤러 + Bean 등록
@RequestMapping("/ShopReviewReply/*")
public class ShopReviewController {

	@Autowired
	private ShopReviewService service;
	// AJAX : 비동기로 통신하여 화면 전체 갱신X 화면 일부 갱신O

	// 댓글 목록 조회 Controller
	// @ResponseBody // 반환되는 값을 ViewName이 아니라 값 자체로 인식 시키는 어노테이션
	@RequestMapping("selectReplyList/{itemNo}")
	public String selectReplyList(@PathVariable("itemNo") int itemNo) {

		System.out.println(itemNo+"번호");
		List<ShopReview> rList = service.selectReplyList(itemNo);

		// JSON : 자바스크립트 객체 표기법 모양으로 작성된 문자열
		// GSON : Google에서 만든 JSON 라이브러리

		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();

		return gson.toJson(rList); // java object 을 js에서 쓰지 못함 그래서 JSON으로 바꿔야 한다.
	}

	// 댓글 삽입 Controller

	@RequestMapping("insertReply/{itemNo}")
	public int insertReply(@PathVariable("itemNo") int itemNo, @RequestParam("replyWriter") int replyWriter,
			String replyShopContent, int starRate,RedirectAttributes ra) {
		Map<String, Object> map = new HashMap<String, Object>();

		// map.put("parentBoardNo",parentBoardNo);
		map.put("replyWriter", replyWriter);
		map.put("itemNo", itemNo);
	
		System.out.println(replyWriter +"replyWriter");
		System.out.println(itemNo +"itemNo");
		
		// 주문 상세번호 161/ 162
		List<ShopBuying> sbList = service.selectOptionSpecifyNoList(map);
		
		int result = 0;
		
		if(!sbList.isEmpty()) {
			
			
			int orderSpecifyNo = sbList.get(0).getOrderSpecifyNo();
			
			map.put("replyContent", replyShopContent);
			map.put("starRate", starRate);
			map.put("orderSpecifyNo", orderSpecifyNo);
			
			result = service.insertReview(map);
		
		}else{
			
	       result = 0;
	  }

		return result;
	}

	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo,
			@RequestParam("replyShopContent") String replyShopContent) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		 map.put("replyNo",replyNo); 
		 map.put("replyShopContent",replyShopContent); 
		 
		
		return 	 service.updateReply(map);
	}
	 

	
	  // 댓글 삭제 controller
	  @RequestMapping("deleteReply/{replyNo}")
	  public int deleteReply(@PathVariable("replyNo") int replyNo){ 
	  
		 return service.deleteReply(replyNo); 
	  
	  
	  }
	 



}
