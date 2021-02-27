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
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.Board;
import com.kh.ehshe.board.model.vo.PageInfo;
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
	@RequestMapping("boardView/{boardNo}")
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
				url = "redirect:../list/";
			} else { // 이전 요청 주소가 있는 경우
				url = "redirect:" + referer;
			}

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시물 입니다.");
		}

		return url;
	}

	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("insert")
	public String insertView() {
		return "board/boardInsert";
	}

	/*
	 * // 게시글 등록 Controller
	 * 
	 * @RequestMapping("insertAction") public String insertAction(@ModelAttribute
	 * Board board,
	 * 
	 * @ModelAttribute("loginMember") Member loginMember,
	 * 
	 * @RequestParam(value="image", required = false) List<MultipartFile> image,
	 * HttpServletRequest request, RedirectAttributes ra) {
	 * 
	 * // @RequestParam(value="images", required = false) List<MultipartFile> images
	 * // --> <input type="file" name="images"> 태그를 모두 얻어와 images 라는 List에 매핑
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>();
	 * 
	 * map.put("memberNo", loginMember.getMemberNo()); map.put("boardTitle",
	 * board.getBoardTitle()); map.put("boardContent", board.getBoardContent());
	 * map.put("categoryCode", board.getCategoryName());
	 * 
	 * // 파일 업로드 확인 for(int i = 0; i<image.size(); i++) {
	 * System.out.println("images[" + i + "] : " +
	 * image.get(i).getOriginalFilename()); }
	 * 
	 * String thumbnailSavePath =
	 * request.getSession().getServletContext().getRealPath("resources/uploadImages"
	 * ); String ContentsavePath =
	 * request.getSession().getServletContext().getRealPath("resources/infoImages");
	 * 
	 * // 게시글 map, 이미지 image, 저장경로 savePath
	 * 
	 * // 게시글 삽입 Service 호출 int result = service.insertBoard(map, image, savePath);
	 * 
	 * 
	 * String url = null; // 게시글 삽입 결과에 따른 View 연결 처리 if(result > 0 ) { swalIcon =
	 * "success"; swalTitle = "게시글 등록 성공"; url = "redirect:" + result; // 상세조회 페이지
	 * 
	 * // 새로 작성한 게시글 상세 조회시 목록으로 버튼 경로 지정하기
	 * request.getSession().setAttribute("returnListURL", "../list/" + type); }else
	 * { swalIcon = "error"; swalTitle = "게시글 등록 실패"; url = "redirect:insert"; }
	 * 
	 * ra.addFlashAttribute("swalIcon", swalIcon); ra.addFlashAttribute("swalTitle",
	 * swalTitle);
	 * 
	 * return url; }
	 */

}
