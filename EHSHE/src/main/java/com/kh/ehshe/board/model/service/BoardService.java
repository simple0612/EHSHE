package com.kh.ehshe.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ehshe.board.model.dao.BoardDAO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
}
