package com.kh.ehshe.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ehshe.board.model.service.BoardService;
import com.kh.ehshe.board.model.service.BoardServiceImpl;
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
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
		List<VBoard> bList = service.selectList(pInfo);

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
	public String boardView(@PathVariable("boardNo") int boardNo, Model model, HttpSession session,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		Member loginMember = (Member)session.getAttribute("loginMember");
		VBoard board = service.selectBoard(boardNo);

		String thumbnailFilePath = null;
		String fileName = null;
		
		String url = null;

		if (board != null) {
			List<Attachment> attachmentList = service.selectAttachmentList(boardNo);

			if (attachmentList != null && !attachmentList.isEmpty()) {
				
				for(Attachment at : attachmentList) {
					thumbnailFilePath = at.getThumbnailFilePath();
					fileName = at.getFileName();
				}
				
				
				model.addAttribute("attachmentList", attachmentList);
				model.addAttribute("thumbnailFilePath", thumbnailFilePath);
				model.addAttribute("fileName", fileName);
			}

			model.addAttribute("board", board);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("boardNo", boardNo);
			if(loginMember != null) {
				map.put("memberNo", loginMember.getMemberNo());
			}
			
			int likeFl = service.selectLikeFl(map);
			model.addAttribute("likeFl", likeFl);
			
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

	// 게시글 등록 Controller
	@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute Board board, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value="image", required=false) List<MultipartFile> image, HttpServletRequest request,
			RedirectAttributes ra) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberNo", loginMember.getMemberNo());
		map.put("boardTitle", board.getBoardTitle());
		map.put("boardContent", board.getBoardContent());
		map.put("categoryName", board.getCategoryName());
		map.put("location", board.getLocation());
		map.put("latitude", board.getLatitude());
		map.put("longitude", board.getLongitude());
		
		// 썸네일 이미지 저장경로
		String thumbnailSavePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		// content 이미지 저장 경로
		String contentsavePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		
		int result = service.insertBoard(map, image, thumbnailSavePath, contentsavePath);
		
		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result; // 상세조회 페이지

			// 새로 작성한 게시글 상세 조회시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../boardList");
		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:insertBoard";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	// ------------------------------------- summernote ------------------------------------------
	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody
	@RequestMapping(value= {"insertImage" , "{boardNo}/insertImage"})
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {

		// 서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String cSavePath = request.getSession().getServletContext().getRealPath("resources/boardImages");

		Attachment at = service.insertImage(uploadFile, cSavePath);

		return new Gson().toJson(at);
	}

	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("{boardNo}/update")
	public String update(@PathVariable("boardNo") int boardNo, Model model) {

		VBoard board = service.selectBoard(boardNo);

		if (board != null) {

			List<Attachment> attachmentList = service.selectAttachmentList(boardNo);

			model.addAttribute("attachmentList", attachmentList);
		}

		model.addAttribute("board", board);

		return "board/boardUpdate";
	}

	// 게시글 수정 Controller
	@RequestMapping("{boardNo}/updateAction")
	public String updateAction(@RequestParam(value="image", required = false) List<MultipartFile> image,
								@PathVariable("boardNo") int boardNo,
								@ModelAttribute Board updateBoard,
								Model model, RedirectAttributes ra,
								HttpServletRequest request,
								@RequestHeader(value = "referer", required = false) String referer) {
		
		
		for(MultipartFile m : image) {
			System.out.println(m.getOriginalFilename());
		}
		
		updateBoard.setBoardNo(boardNo);
		
		// 파일 저장 경로 얻어오기
		String tSavePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		String cSavePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
		
		// 파일 수정 Service 호출
		int result = service.updateBoard(updateBoard, image, tSavePath);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../"+boardNo;  
		}else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	@RequestMapping("deleteAction/{boardNo}")
	public String deleteBoard(@PathVariable("boardNo") int boardNo, RedirectAttributes ra,
								HttpServletRequest request,
								@RequestHeader(value = "referer", required = false) String referer) {
		
		int result = service.deleteBoard(boardNo);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 삭제 성공";
			url = "redirect:../boardList";
		}else {
			swalIcon = "error";
			swalTitle = "게시글 삭제 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);   
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	// 게시글 검색 Controller
	@RequestMapping("search")
	public String searchBoard(@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
								@RequestParam(value="sk", required=false) String sk,
								@RequestParam(value="sv", required=false) String sv,
								Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sk", sk);
		map.put("sv", sv);
		
		PageInfo pInfo = service.getPageInfo(cp, map);
		
		// 게시글 목록 조회
		List<VBoard> bList = service.selectSearchList(pInfo, map);
		
		// 썸네일 목록 조회
		if(!bList.isEmpty()) {
			List<Attachment> thList = service.selectThumbnailList(bList);
			model.addAttribute("thList", thList);
		}
		sk = (String) map.get("sk");
		sv = (String) map.get("sv");
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("sk", sk);
		model.addAttribute("sv", sv);
		
		return "board/boardList";
	}
	
   // 좋아요 추가 Contoller
   @ResponseBody
   @RequestMapping("insertLike")
   public int insertLike(@RequestParam("boardNo") int boardNo, @ModelAttribute("loginMember") Member loginMember) {

      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("boardNo", boardNo);
      map.put("memberNo", loginMember.getMemberNo());

      int result = service.insertLike(map);
      
      return result;
   }

   // 좋아요 삭제 Contoller
   @ResponseBody
   @RequestMapping("deleteLike")
   public int deleteLike(@RequestParam("boardNo") int boardNo, @ModelAttribute("loginMember") Member loginMember) {

      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("boardNo", boardNo);
      map.put("memberNo", loginMember.getMemberNo());

      int result = service.deleteLike(map);

      return result;
   }

   // 좋아요 카운트 Contoller
   @ResponseBody
   @RequestMapping("selectLikeCount")
   public int selectLikeCount(@RequestParam("boardNo") int boardNo) {

      return service.selectLikeCount(boardNo);
   }
	
}
