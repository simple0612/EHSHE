package com.kh.ehshe.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.member.model.service.MemberService;
import com.kh.ehshe.member.model.vo.Member;

@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class MemberController {

	@Autowired
	private MemberService service;
	
	// 로그인 화면 Controller
	@RequestMapping("loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	// 로그인 Controller
	@RequestMapping("login")
	public String login(Member member,
						@RequestParam(value="saveId", required=false) String saveId,
						HttpServletResponse response, RedirectAttributes ra, Model model) {
		
		Member loginMember = service.login(member);
		
		String url = null;		
		if(loginMember != null) { // 로그인 성공 시
			model.addAttribute("loginMember", loginMember);
			
			ra.addFlashAttribute("swalTitle", "로그인 성공");
			
			// 쿠키 생성
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			// 쿠키 유지 시간 지정
			if(saveId != null) { // 아이디 저장이 체크 되었을 경우
				// 한 달 동안 유지되는 쿠키 생성
				cookie.setMaxAge(60 * 60 * 24 * 30); // 초 단위로 지정				
			} else { // 아이디 저장이 체크 되어있지 않은 경우
				
				cookie.setMaxAge(0);
				// - 쿠기를 생성하지 않겠다
				// - 기존에 있던 쿠기도 없애겠다
			}
			
			// 생성된 쿠키 객체를 응답 객체에 담아서 내보냄
			response.addCookie(cookie);
		
			// 성공 시 메인페이지
			url = "/"; 
			
		} else { // 로그인 실패 시
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "로그인 실패");
			ra.addFlashAttribute("swalText", "아이디 또는 비밀번호가 일치하지 않습니다");
			
			// 실패 시 로그인 화면으로 재요청 
			url = "loginView";
		}
		return "redirect:" + url;
	}
	
	// 로그아웃 Controller
	@RequestMapping("logout")
	public String logout(SessionStatus status) {		
		status.setComplete();
		return "redirect:/";
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
