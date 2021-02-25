package com.kh.ehshe.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ehshe.board.model.service.BoardService;

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
	public String selectList() {
		return "board/boardList";
	}
	
	
	
	
}
