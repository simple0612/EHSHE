package com.kh.ehshe.shop.controller;

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
import com.kh.ehshe.shop.model.service.ShopService;
import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopOption;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;

@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/shop/*")
@SessionAttributes({"loginMember"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class ShopController {

	@Autowired
	private ShopService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("shopMain")
	public String shopMain(Model model) {
		
		List<Shop> sList = service.selectShopMainList();
		model.addAttribute("sList",sList);
		
		if(sList != null && !sList.isEmpty()) {
		 List<ShopAttachment> thumbnailList  = service.selectMainAttachmentlList(sList);
		
		 if(thumbnailList != null) {
				model.addAttribute("thMList",thumbnailList);
			}
		
		}
		
		return "shop/shopMain";
	}

	@RequestMapping("shopList/{type}")
	public String shopList(@PathVariable("type") int type,
	    @RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		ShopPageInfo pInfo = service.getPageInfo(type, cp);

		List<Shop> sList = service.selectShopList(pInfo);
		
		if(sList != null && !sList.isEmpty()) {
			
			List<ShopAttachment> thumbnailList = service.selectShopThumbnailList(sList);
			
			if(thumbnailList != null) {
				model.addAttribute("thList",thumbnailList);
			}
		}
			
		model.addAttribute("sList", sList);
		model.addAttribute("pInfo", pInfo);
		
		return "shop/shopList";
	}

	// 상세조회
	@RequestMapping("{type}/{itemNo}")
	public String shopView(@PathVariable("type") int type
			, @PathVariable("itemNo") int itemNo, 
			Model model,
			@RequestHeader(value = "referer", required = false) String referer, 
			RedirectAttributes ra) {

		Shop shop = service.selectShopBoard(itemNo, type);

		String url = null;

		if(shop != null) {
			
			ShopAttachment ShopAttachmentList =service.selectShopAttachmentList(itemNo);
			 
			List<ShopOption> ShopOptionList = service.selectShopOptionList(itemNo);
		
			if(ShopAttachmentList != null && ShopOptionList != null) {
				
				model.addAttribute("ShopAttachmentList", ShopAttachmentList);
				model.addAttribute("ShopOptionList",ShopOptionList);
			}
		
			model.addAttribute("shop", shop);
			url ="shop/shopView";
		}else {
			
		   if(referer == null) {
		   url = "redirect:../shopList/" + type;
			
		}else {
			url = "redirect:" + referer;
		}
		ra.addFlashAttribute("swalIcon","error");
		ra.addFlashAttribute("swalTitle","존재하지 않는 게시글입니다.");
	}

		return url;
	}

	// shop 게시글 등록 전환
	@RequestMapping("{type}/shopInsert")
	public String shopInsert() {

		return "shop/shopInsert";
	}
     
	// shop 게시글 등록
	@RequestMapping("{type}/shopInsertAction")
	public String shopInsertAction(@ModelAttribute Shop shop,
			@PathVariable("type") int type,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request,
			@RequestParam(value = "sizemenu", required = false) List<String> sizemenu,
			@RequestParam(value = "colormenu", required = false) List<String> colormenu,
			RedirectAttributes ra) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("shopContent", shop.getItemContent());
		map.put("shopCategory", shop.getItemCategory());
		map.put("shopItemNm", shop.getItemNm());
		map.put("shopItemPrice", shop.getItemPrice());
		map.put("shopTransCharge", shop.getTransCharge());

		String savePath = null;

		if (type == 1) {
			savePath = request.getSession().getServletContext().getRealPath("resources/clothesImages");
		} else if (type == 2) {
			savePath = request.getSession().getServletContext().getRealPath("resources/accessoryImages");
		} else {
			savePath = request.getSession().getServletContext().getRealPath("resources/etcImages");
		}

		int result = service.insertShop(map, images, savePath,sizemenu,colormenu);

		
		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:"+result;

			request.getSession().setAttribute("returnListURL", "../shopList/" + shop.getItemCategory());

		} else {
			swalIcon = "error";
			swalTitle = "게시글 등록 실패";
			url = "redirect:shopInsert";
		}
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}
	
	// -------------------------------- summernote --------------------------------
	// summernote에 업로드된 이미지 저장 Controller
	
	@ResponseBody // 응답 시 값 자체를 돌려보냄
	@RequestMapping(value={"{type}/ShopInsertImage" ,"{type}/{itemNo}/ShopInsertImage"})
	public String insertShopImage(HttpServletRequest request,
							   @PathVariable("type") int type,
							   @RequestParam("uploadFile") MultipartFile uploadFile) {
		// 서버에 파일(이미지)를 저장할 폴더 경로 얻어오기
	   System.out.println("realType"+type);
		String savePath=null;
		
		if(type == 1) {
			savePath
			 = request.getSession().getServletContext().getRealPath("resources/clothesImages");
		}else if(type== 2) {
			savePath
			 = request.getSession().getServletContext().getRealPath("resources/accessoryImages");
		}else{
			savePath
			 = request.getSession().getServletContext().getRealPath("resources/etcImages");
		}
	
		
		ShopAttachment at =service.insertShopImage(uploadFile,savePath,type);
		
		
		// java -> js로 객체 전달 : JSON
		return new Gson().toJson(at);
		
	}
	
	// shop 업데이트 
	@RequestMapping("{type}/{itemNo}/update")
	public String shopUpdate(@PathVariable("itemNo") int itemNo,
							  @PathVariable("type") int type,
							  Model model) {
		
		Shop shop = service.selectShopBoard(itemNo, type);
		
		
		if(shop != null) {
			
			ShopAttachment shopAttachment = service.selectShopAttachmentList(itemNo);
			
			model.addAttribute("shopAttachmnet",shopAttachment);
			
		}
		
		model.addAttribute("shop", shop);
		
		
		return "shop/shopUpdate";
		
		
	}

	
	// Shop게시글 수정 Controller
     @RequestMapping("{type}/{itemNo}/shopUpdateAction")	 
     public String ShopUpdateAction(@PathVariable("itemNo") int itemNo,
    		 					@PathVariable("type") int type,
    		 					@ModelAttribute Shop updateShopBoard,
    		 					 Model model,RedirectAttributes ra,
    		 					HttpServletRequest request,
    		 					@RequestParam(value="images" ,required=false) MultipartFile images){
    	 
    updateShopBoard.setItemNo(itemNo);
    
    
    
    String savePath = null;	 
    
	if(type==1){
		savePath = request.getSession().getServletContext().getRealPath("resources/clothesImages");
	} else if(type==2){
		savePath = request.getSession().getServletContext().getRealPath("resources/accessoryImages");
	} else {
		savePath = request.getSession().getServletContext().getRealPath("resources/etcImages");
	}    	 
    	
	
    
	int result = service.updateShopBoard(updateShopBoard,images,savePath);
	
	String url =null;
	
	if(result > 0) {
		swalIcon = "success";
		swalTitle = "게시글 수정 성공";
		url = "redirect:../"+itemNo;
	}else {
		swalIcon = "error";
		swalTitle = "게시글 수정 실패";
		url = "redirect:" + request.getHeader("referer");
	}
    	 
	ra.addFlashAttribute("swalIcon", swalIcon);
	ra.addFlashAttribute("swalTitle", swalTitle); 
    	 
	
	return url;
     }
}
