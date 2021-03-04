package com.kh.ehshe.place.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.place.model.service.PlaceService;
import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.Place;
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
	
	public String insertAction(@ModelAttribute Place place, @ModelAttribute("loginMember") Member loginMember,
			@RequestParam(value="image", required=false) List<MultipartFile> image,
			HttpServletRequest request, RedirectAttributes ra) {
		
		Map<String, Object> map =  new HashMap<String, Object>();
		
		map.put("memberNo", loginMember.getMemberNo());
		map.put("placeTitle", place.getPlaceTitle());
		map.put("placeContent", place.getPlaceContent());
		map.put("location", place.getLocation());
		map.put("categoryName", place.getCategoryName());
		map.put("phone", place.getPhone());
		map.put("latitude", place.getLatitude());
		map.put("longitude", place.getLongitude());
		map.put("priceRange", place.getPriceRange());
		map.put("businessHours", place.getBusinessHours());
		map.put("parking", place.getParking());
		map.put("holiday", place.getHoliday());
		map.put("enroll", place.getEnroll());
		map.put("enrollContents", place.getEnrollContents());
		
		// 썸네일 이미지 저장경로
		String thumbnailSavePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		// content 이미지 저장 경로
		String contentsavePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		
		int result = service.insertPlace(map, image, thumbnailSavePath, contentsavePath);
		
		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result; // 상세조회 페이지

			// 새로 작성한 게시글 상세 조회시 목록으로 버튼 경로 지정하기
			request.getSession().setAttribute("returnListURL", "../placeList");
		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:admin/insertPlace";
			// -----------수정부분 ---------
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}
	
	//---------------------------------- summernot ------------------------------------------
	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {

		// 서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String cSavePath = request.getSession().getServletContext().getRealPath("resources/updateImages");

		PAttachment at = service.insertImage(uploadFile, cSavePath);

		return new Gson().toJson(at);
	}
	
	// 게시글 수정 화면 전환용 Controller
	@RequestMapping("{placeNo}/update")
	public String update(@PathVariable("placeNo") int placeNo, Model model) {

		VPlace place = service.selectPlace(placeNo);

		if (place != null) {

			List<PAttachment> attachmentList = service.selectAttachmentList(placeNo);

			model.addAttribute("attachmentList", attachmentList);
		}  
		model.addAttribute("place", place);

		return "admin/place/placeUpdate";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("deleteAction/{placeNo}")
	public String deleteBoard(@PathVariable("placeNo") int placeNo, RedirectAttributes ra,
								HttpServletRequest request,
								@RequestHeader(value = "referer", required = false) String referer) {
		
		int result = service.deletePlace(placeNo);
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
