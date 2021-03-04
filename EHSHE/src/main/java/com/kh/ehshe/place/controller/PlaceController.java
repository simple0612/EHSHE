package com.kh.ehshe.place.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.place.model.service.PlaceService;
import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
import com.kh.ehshe.place.model.vo.VPlace;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/place/*")
public class PlaceController {

	@Autowired
	private PlaceService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 게시글 목록 조회 Controller
	@RequestMapping("placeList")
	public String PlaceList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		PlacePageInfo pInfo = service.getPlacePageInfo(cp);
		
		// 게시글 목록 조회
		List<VPlace> pList = service.selectList(pInfo);
		
		if (pList != null && !pList.isEmpty()) {
			List<PAttachment> thumbnailList = service.selectThumbnailList(pList);

			if (thumbnailList != null) {
				model.addAttribute("thList", thumbnailList);
			}
		}
		model.addAttribute("pList", pList);
		model.addAttribute("pInfo", pInfo);
		
		return "place/placeList";
	}
	
	// 게시글 상세 조회 Controller
	@RequestMapping("{placeNo}")
	public String placeView(@PathVariable("placeNo") int placeNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		VPlace place = service.selectPlace(placeNo);
		
		String thumbnailFilePath = null;
		String fileName = null;
		
		String url = null;
		
		if (place != null) {
			List<PAttachment> attachmentList = service.selectAttachmentList(placeNo);

			if (attachmentList != null && !attachmentList.isEmpty()) {	
				
				model.addAttribute("thumbnailFilePath", thumbnailFilePath);
				model.addAttribute("fileName", fileName);
			}

			model.addAttribute("place", place);
			url = "place/placeView";

		} else {
			if (referer == null) {
				url = "redirect:../placeList/";
			} else {
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시물 입니다.");
		}
		return url;
	}
	
	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("insertPlace")
	public String insertView() {
		return "admin/insertPlace";
	}
	
	public String insertAction() {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
