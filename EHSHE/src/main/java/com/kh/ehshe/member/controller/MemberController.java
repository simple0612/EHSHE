package com.kh.ehshe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/member/*")
@SessionAttributes({ "loginMember" }) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class MemberController {

	// @Autowired
	// private MemberService service
	
	// 로그인 화면 Controller
	@RequestMapping("loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	// 로그인 Controller
	@RequestMapping("login")
	public String login() {
		return null;
	}
	
	// 로그아웃 Controller
	@RequestMapping("logout")
	public String logout() {		
		return null;
	}
	
	// 이용약관 화면 Controller
	@RequestMapping("tosView")
	public String tosView() {
		return "member/tosView";
	}
	
	// 아이디 중복 체크 Controller (AJAX)
	@RequestMapping("idDupCheck")
	public int idDupCheck() {
	 return 0;
	}
	
	// 회원 가입 화면 Controller
	@RequestMapping("signUpView")
	public String signUpView() {
		return "member/signUpView";
	}
	
	// 회원 가입 Controller
	@RequestMapping("signUp")
	public String signUp() {
		return null;
	}

	// 회원 가입 완료 화면 Controller
	@RequestMapping("signUpCompleteView")
	public String signUpCompleteView() {
		return "member/signUpCompleteView";
	}
	
	// 아이디 찾기 화면 Controller
	@RequestMapping("findIdView")
	public String findIdView() {
		return "member/findIdView";
	}
	
	// 아이디 찾기 Controller
	@RequestMapping("findId")
	public String findId() {
		return null;
	}

	// 아이디 찾기 완료 화면 Controller
	@RequestMapping("findIdCompleteView")
	public String findIdCompleteView() {
		return "member/findIdCompleteView";
	}
	
	// 비밀번호 찾기 화면 Controller
	@RequestMapping("findPwView")
	public String findPwView() {
		return "member/findPwView";
	}

	// 비밀번호 찾기  Controller
	@RequestMapping("findPw")
	public String findPw() {
		return null;
	}

	// 비밀번호 변경 화면  Controller
	@RequestMapping("changePwView")
	public String changePwView() {
		return "member/changePwView";
	}

	// 비밀번호 변경  Controller
	@RequestMapping("changePw")
	public String changePw() {
		return null;
	}

	


}
