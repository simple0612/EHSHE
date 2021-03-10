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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ehshe.shop.model.service.ShopReplyService;
import com.kh.ehshe.shop.model.vo.ShopReply;



@RestController // 값 자체만 반환하는 컨트롤러 + Bean 등록
@RequestMapping("/ShopReply/*")
public class ShopReplyController {
	
	@Autowired
	private ShopReplyService service;

	//@ResponseBody // 반환되는 값을 ViewName이 아니라 값 자체로 인식 시키는 어노테이션
	@RequestMapping("selectReplyList/{parentBoardNo}")
	public String selectReplyList(@PathVariable("parentBoardNo") int parentBoardNo) {
			
		List<ShopReply> rList = service.selectRepltList(parentBoardNo);
		
		// JSON : 자바스크립트 객체 표기법 모양으로 작성된 문자열
		// GSON : Google에서 만든 JSON 라이브러리
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList); // java object 을 js에서 쓰지 못함 그래서 JSON으로 바꿔야 한다.
	}
	
	// 댓글 삽입 Controller 
	
	@RequestMapping("insertReply/{parentBoardNo}")
	public int insertReply(@PathVariable("parentBoardNo") int parentBoardNo,
						   @RequestParam("replyWriter") int replyWriter,
						   String replyContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("parentBoardNo",parentBoardNo);
		map.put("replyWriter",replyWriter);
		map.put("replyContent",replyContent);
		
		int result = service.insertReply(map);

		return result;
	}
	
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo,
			//@RequestParam("replyContent") String replyContent) {
			@ModelAttribute ShopReply reply) {
		
		
		
		/*Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("replyNo",replyNo);
		map.put("replyContent",replyContent);
		int result = service.updateReply(map);*/
		
		
		reply.setParentReplyNo(replyNo);
		// 커맨드 객체 updateReply를 이용하여 replyContent를 전달받고,
		// @PathVariavle을 통해 얻어온 replyNo를 커맨드객체를 세팅하여 재활용
		
		return service.updateReply(reply);
	}
	
	
	// 댓글 삭제 controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		return service.deleteReply(replyNo);
	}
	
	// 대댓글 삽입 Controller
	@RequestMapping("insertChildReply/{parentBoardNo}")
	public int insertChildReply(@PathVariable("parentBoardNo") int parentBoardNo,
								int parentReplyNo, String replyContent,int replyWriter){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("parentBoardNo",parentBoardNo);
		map.put("parentReplyNo",parentReplyNo);
		map.put("replyContent",replyContent);
		map.put("replyWriter",replyWriter);
		
		return service.insertChildReply(map);
	}

	
	
	
	
}
