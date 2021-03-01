package com.kh.ehshe.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.board.model.service.BoardService;
import com.kh.ehshe.board.model.service.BoardServiceImpl;
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 게시글 목록 조회 Controller
	@RequestMapping("boardList")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		PageInfo pInfo = service.getPageInfo(cp);
		
		// 게시글 목록 조회
		List<Board> bList = service.selectList(pInfo);

		if (bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시
			List<Attachment> thumbnailList = service.selectThumbnailList(bList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);

		return "board/boardList";
	}

	// 게시글 상세 조회 Controller
	@RequestMapping("{boardNo}")
	public String boardView(@PathVariable("boardNo") int boardNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		Board board = service.selectBoard(boardNo);

		String url = null;

		if (board != null) {
			List<Attachment> attachmentList = service.selectAttachmentList(boardNo);

			if (attachmentList != null && !attachmentList.isEmpty()) {
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("board", board);
			url = "board/boardView";

		} else {
			// 이전 요청 주소가 없는 경우
			if (referer == null) {
				url = "redirect:../boardList/";
			} else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시물 입니다.");
		}

		return url;
	}

	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("insertBoard")
	public String insertView() {
		return "board/insertBoard";
	}

	

}
