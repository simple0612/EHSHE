package com.kh.ehshe.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ehshe.board.model.dao.BoardDAO;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;

	public PageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new PageInfo(cp, listCount);
	}

	public List<Board> selectList(PageInfo pInfo) {
		
		return dao.selectList(pInfo);
	}
}
