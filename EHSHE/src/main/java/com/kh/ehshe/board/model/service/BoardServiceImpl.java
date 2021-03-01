package com.kh.ehshe.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.board.model.dao.BoardDAO;
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;

	// 게시판 전체 게시글수 조회 Service 구현
	@Override
	public PageInfo getPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new PageInfo(cp, listCount);
	}

	// 게시글 목록 조회 service 구현
	@Override
	public List<Board> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> selectThumbnailList(List<Board> bList) {
		return dao.selectThumbnailList(bList);
	}

	// 게시글 상세 조회 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		
		Board board = dao.selectBoard(boardNo);
		
		if( board != null) {
			int result = dao.increaseReadCount(boardNo);
			
			if(result > 0 ) { // DB 조회수 증가 성공 시
				// 먼저 조회된 board의 조회수도 1증가
				board.setReadCount(board.getReadCount() + 1);
			}
		}
		
		return board;
	}

	// 게시글 이미지 조회 Service
	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return dao.selectAttachmentList(boardNo);
	}
	
}
