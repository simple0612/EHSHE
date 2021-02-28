package com.kh.ehshe.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/shop2/*")
@SessionAttributes({ "loginMember" }) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class shopCartController {
	
	
	@RequestMapping("cart")
	public String cart() {
		return "shop/cart";
	}
	
	@RequestMapping("payment")
	public String payment() {
		
		return "shop/payment";
	}

	
}
