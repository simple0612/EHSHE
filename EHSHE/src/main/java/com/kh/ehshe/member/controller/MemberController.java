package com.kh.ehshe.member.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/member/*")
@SessionAttributes({ "loginMember" }) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class MemberController {

	
	@RequestMapping("loginpage")
	public String loginView() {
		return "member/loginpage";
	}

	


}
