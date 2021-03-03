package com.kh.ehshe.board.controller;

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
import com.kh.ehshe.board.model.vo.VBReply;
import com.kh.ehshe.board.model.service.ReplyService;
import com.kh.ehshe.board.model.vo.BReply;

// RestController : Controller 내부에 작성도니 메소드의 반환 값이 모두 viewName이 아닌 값 자체인 Controller

//@Controller // 컨트롤러 + Bean 등록
@RestController // 값 자체만 반환하는 컨트롤러 + Bean 등록
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	private com.kh.ehshe.board.model.service.ReplyService service;
	
	// 댓글 목록 조회 Controller 
	//@ResponseBody // 반환되는 값을  viewName이 아니라 값 자체로 인식 시키는 어노테이션
	@RequestMapping("selectReplyList/{parentBoardNo}")
	public String selectReplyList(@PathVariable("parentBoardNo") int parentBoardNo) {
		
		List<VBReply> rList = service.selectReplyList(parentBoardNo);
		
		// JSON : 자바스크립트 객체 표기법 모양으로 작성된 문자열
		// GSON : Google에서 만든 JSON 라이브러리
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		
		return gson.toJson(rList);
	}
	// AJAX : 비동기로 통신하여 화면 전체 갱신 X 화면 일부 갱신 O
	
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
	
	// 댓글 수정 Controller
	@RequestMapping("updateReply/{replyNo}")
	public int updateReply(@PathVariable("replyNo") int replyNo, 
							/*String replyContent*/
							@ModelAttribute BReply reply) {
		
		reply.setReplyNo(replyNo);
		// 커맨드 객체(updateReply)를 이용하여 replyContent를 전달받고,
		// @PathVariable을 통해 얻어온 replyNo를 커맨드 객체에 세팅하여 재활용
		
		return service.updateReply(reply);
	}
	
	// 댓글 삭제 Controller
	@RequestMapping("deleteReply/{replyNo}")
	public int deleteReply(@PathVariable("replyNo") int replyNo) {
		
		return service.deleteReply(replyNo);
	}
	
	// 대댓글 삽입 Controller
	@RequestMapping("insertChildReply/{parentBoardNo}")
	public int insertChildReply(@PathVariable("parentBoardNo") int parentBoardNo,
								int parentReplyNo, String replyContent, int replyWriter) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentBoardNo", parentBoardNo);
		map.put("parentReplyNo", parentReplyNo);
		map.put("replyContent", replyContent);
		map.put("replyWriter", replyWriter);
		
		return service.insertChildReply(map);
	}
	
	
	
	
	
	
	
}
