package com.kh.ehshe.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ehshe.board.model.service.BoardService;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	@RequestMapping("boardList")
	public String boardList(@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							Model model) {
		
		PageInfo pInfo = service.getPageInfo(cp);
		
		// 게시글 목록 조회
		List<Board> bList = service.selectList(pInfo);
		
		return "board/boardList";
	}
	
	@RequestMapping("boardView")
	public String boardView() {
		
		return null;
	}
	
}
