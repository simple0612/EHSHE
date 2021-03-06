package com.kh.ehshe.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.shop.model.service.ShopCartService;
import com.kh.ehshe.shop.model.vo.Order;
import com.kh.ehshe.shop.model.vo.ShopCart;

@Controller
@RequestMapping("/shop2/*")
@SessionAttributes({ "loginMember"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class ShopCartController {
	
	@Autowired
	private ShopCartService service;
	
	
	private String swalIcon;
	private String swalTitle;
	private String swalText;
	
	
	@RequestMapping("cart")
	public String cart(Model model,
					   @ModelAttribute("loginMember") Member loginMember) {
		
		
		int memberNo =loginMember.getMemberNo();
		
		
		List<ShopCart> cList = service.selectCartList(memberNo);
		
			//System.out.println(cList);
		
		
		model.addAttribute("cList", cList);
		
		
		return "shop/cart";
	}
	
	/*@RequestMapping("payment")
	public String payment() {
		return "shop/payment";
	}*/
	
	@RequestMapping("cart/deleteCartItem")
	@ResponseBody
	public int deleteCartItem(@ModelAttribute("loginMember") Member loginMember,
			                     @RequestParam("optionSpecifyNo") int optionSpecifyNo ) {
		
		int memberNo =loginMember.getMemberNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("optionSpecifyNo", optionSpecifyNo);
		map.put("memberNo", memberNo);
		
		return service.deleteCartItem(map);
	}
	
	@RequestMapping("cart/deleteAllCartItem")
	@ResponseBody
	public int deleteAllCartItem(@ModelAttribute("loginMember") Member loginMember,
								 @RequestParam("optionSpecifyNoList") String optionSpecifyNoList ) {
		
		int memberNo =loginMember.getMemberNo();
		
		//System.out.println(optionSpecifyNoList); //21,22,23
		
		//String 배열에 ,로 구분해서 삽입
		String[] str = optionSpecifyNoList.split(",");
		
		// ArrayList 생성
		ArrayList<String> optionSNL = new ArrayList<String>();
		
		//ArrayList에 String배열 삽입.
		for(int i=0; i<str.length; i++) {
			optionSNL.add(str[i]);
		}
		
		//System.out.println(optionSNL);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optionSpecifyNoList", optionSNL);
		map.put("memberNo", memberNo);
		
		return service.deleteAllCartItem(map);
	}
	
	
	// 주문하기
	@RequestMapping("ordersheet")
	public String ordersheet(String[] ck,
			@ModelAttribute("loginMember") Member loginMember,
			@RequestParam("tprice") int tprice,
			@RequestParam("sprice") int sprice,
			@RequestParam("tsprice") int tsprice,
			Model model,
			RedirectAttributes ra) {
		
		//System.out.println(Arrays.toString(ck)); //21,22,23
		//System.out.println(tprice);
		//System.out.println(sprice);
		int memberNo =loginMember.getMemberNo();
//		String memberAddr = loginMember.getMemberAddr();
//		String memberPhone = loginMember.getMemberPhone();
//		
//		System.out.println(memberAddr);
//		System.out.println(memberPhone);
		
		ArrayList<String> optionNoList = new ArrayList<String>();
		
		for(int i=0; i<ck.length; i++) {
			optionNoList.add(ck[i]);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("optionNoList", optionNoList);
		
		List<ShopCart> bList = service.ordersheet(map);
		
		/*
		 * for(ShopCart s : bList) { System.out.println(s); }
		 */
		
		
		model.addAttribute("tsprice", tsprice); //
		model.addAttribute("tprice", tprice); // 
		model.addAttribute("sprice", sprice); // 
		model.addAttribute("bList", bList);
		model.addAttribute("optionNoList", optionNoList);
		
		//System.out.println(optionNoList);
		
		if(bList == null) {
			swalIcon = "info";
			swalTitle = "결제할 상품이 없습니다.";
			swalText = "결제할 상품을 추가해주세요.";
			
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);
		
		
		return "shop/payment";
	}
	

	@ResponseBody
	@RequestMapping("ordersheet/insertPayment")
	public int insertPayment(@ModelAttribute("loginMember") Member loginMember,
							@RequestParam("orderPrice") int orderPrice,
							@RequestParam("orderRecipient") String orderRecipient,
							@RequestParam("orderTel") String orderTel,
							@RequestParam("orderAddr") String orderAddr,
							@RequestParam("OptionSpecifyNo") String OptionSpecifyNo,
							@RequestParam("orderItemName") String orderItemName
							) {
		
		int memberNo =loginMember.getMemberNo();
		
//		System.out.println(orderPrice); // 100
//		System.out.println(orderRecipient); // 유저이
//		System.out.println(orderTel); // 01022222222
//		System.out.println(orderAddr); // 17132 경기도 용인시 처인구 ~
//		System.out.println(OptionSpecifyNo); // 21, 22
//		System.out.println(orderItemName); // 커플반지 , 티셔츠 , 잠옷 = > (커블반지 외 2개).
		
		String[] str = OptionSpecifyNo.split(",");
		ArrayList<String> optionSNL = new ArrayList<String>();
		
		for(int i=0; i<str.length; i++) {
			optionSNL.add(str[i]);
		}
//		System.out.println(optionSNL); // [21, 22]
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("optionSNL", optionSNL); //OptionSpecifyNo
		map.put("orderPrice", orderPrice);
		map.put("orderRecipient", orderRecipient);
		map.put("orderTel", orderTel);
		map.put("orderAddr", orderAddr);
		map.put("orderContent", orderItemName);
		
		int result = service.insertPayment(map);
		
		
		return result;
	}

	
}
