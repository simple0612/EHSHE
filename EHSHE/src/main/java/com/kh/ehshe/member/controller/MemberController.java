package com.kh.ehshe.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.member.model.service.MemberService;
import com.kh.ehshe.member.model.vo.Member;

@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/member/*")
@SessionAttributes({"loginMember", "memberInfo", "memberInfo2"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class MemberController {

	// Spring에서는 객체의 생명주기를 Spring Container가 관리할 수 있도록 함
	// == bean으로 등록하여 IOC를 통해 제어
	
	// 빈 스캐닝(component-scan)을 통해 등록된 bean 중 알맞은 bean을 해당 변수에
	// 의존성 주입(DI)를 진행함
	
	@Autowired
	private MemberService service;
	
	// sweet alert 메세지 전달용 변수 선언
	private String swalIcon;
	private String swalTitle;
	private String swalText;
	
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
		
		// 비즈니스 로직 수행 후 결과 반환 받기
		Member loginMember = service.login(member);
		
		// Model 객체는 기본적으로 request scope
		// @SessionAttributes를 이용해서 session scope로 변경
		
		// 로그인 성공, 실패에 따라 요청 경로를 저장할 변수
		String url = null;
		
		// 로그인 성공 시
		if(loginMember != null) {
			// 로그인 정보 세션에 등록
			model.addAttribute("loginMember", loginMember);
			
			ra.addFlashAttribute("swalTitle", "로그인 성공");
			
			// 쿠키 생성
			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			// 쿠키 유지 시간 지정
			if(saveId != null) {
				// 한 달 동안 유지되는 쿠키 생성 (초 단위로 지정)
				cookie.setMaxAge(60 * 60 * 24 * 30);				
			} else { 
				
				cookie.setMaxAge(0);
				// - 쿠기를 생성하지 않겠다
				// - 기존에 있던 쿠기도 없애겠다
			}
			
			// 생성된 쿠키 객체를 응답 객체에 담아서 내보냄
			response.addCookie(cookie);
		
			// 성공 시 메인페이지
			url = "/"; 
			
		} else {
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
		// SessionStatus : 세션의 상태를 관리할 수 있는 객체
		// setComplete(); @SessionAttributes로 Session에 등록된 값을 모두 지움
		status.setComplete();
		return "redirect:/";
	}
	
	// 이용약관 화면 Controller
	@RequestMapping("tosView")
	public String tosView() {
		return "member/tosView";
	}
	
	// 회원 가입 화면 Controller
	@RequestMapping("signUpView")
	public String signUpView() {
		return "member/signUpView";
	}
	
	// 아이디 중복 체크 Controller (AJAX)
	@ResponseBody
	@RequestMapping("idDupCheck")
	public int idDupCheck(@RequestParam("memberId") String memberId) {
		//System.out.println(memberId);
		
		// 아이디 중복 검사 서비스 호출
		int result = service.idDupCheck(memberId);
		
		// AJAX에서 반환값이 주소/경로가 아닌 값 자체로 인식해서 
		// 요청부분으로 돌아가게하는 별도 방법이 존재
		// == @ResponseBody
		
		return result;
	}

	// 회원 가입 Controller
	@RequestMapping("signUp")
	public String signUp(@ModelAttribute Member signUpMember,
						 Model model,
						 RedirectAttributes ra) {
		
		//System.out.println(signUpMember);
		
		// signUpMember : 회원 가입 시 입력한 값들이 저장된 커맨드 객체
		// 동일한 name 속성을 가진 input 태그 값은 커맨드 객체 사용 가능
		
		int result = service.signUp(signUpMember);
		
		// 회원 가입 성공 여부에 따른 메세지 지정
		if(result > 0) {
			/*
			 * swalIcon = "success"; swalTitle = "회원 가입 성공";
			 */
			model.addAttribute("loginMember", signUpMember);
			
		}else {
			swalIcon = "error";
			swalTitle = "회원 가입 실패";
			swalText = "회원 가입 과정에서 문제가 발생하였습니다";			
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return "member/signUpCompleteView";
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
	public String findId(@ModelAttribute Member member, 
						 Model model, RedirectAttributes ra) {
		
		int result = service.checkMemberInfo(member);
		
		String url = null;
		
		if(result > 0) {	
			Member memberInfo = service.findId(member);
			//System.out.println(memberInfo);
			
			if(memberInfo != null) {
				model.addAttribute("memberInfo", memberInfo);
			}
			
			url = "findIdCompleteView";
		
		} else {
			url = "findIdView";	
			swalIcon = "error";
			swalTitle = "입력하신 정보와 일치하는 계정이 없습니다.";
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return "redirect:" + url;
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
	public String findPw(@ModelAttribute Member member, 
			 			 Model model, RedirectAttributes ra) {
		
		int result = service.checkMemberPw(member);
		//System.out.println(member);
		
		String url = null;
		
		if(result > 0) {	
			Member memberInfo2 = service.findPw(member);
			//System.out.println(memberInfo2);
			
			if(memberInfo2 != null) {
				model.addAttribute("memberInfo2", memberInfo2);
			}
			
			url = "changePwView";
		
		} else {
			url = "findPwView";	
			swalIcon = "error";
			swalTitle = "입력하신 정보와 일치하는 계정이 없습니다.";
		}
		
		return "redirect:" + url;
	}

	// 비밀번호 변경 화면  Controller
	@RequestMapping("changePwView")
	public String changePwView() {
		return "member/changePwView";
	}

	// 비밀번호 변경 Controller
	@RequestMapping(value = "updatePw", method = RequestMethod.POST) 
	public String changePw(@ModelAttribute("memberInfo2") Member memberInfo2,
						   @RequestParam("newPw1") String newPw,
						   RedirectAttributes ra) {
	  
		Map<String, Object> map = new HashMap<String, Object>();
	  
		map.put("memberId", memberInfo2.getMemberId());
		map.put("newPw", newPw);
	
		int result = service.updatePw(map);
	  
		String url = null;
	  
		if(result > 0) { 
			swalIcon = "success"; 
			swalTitle = "비밀번호 변경 성공"; 
			url = "loginView";
	  
		} else { 
			swalIcon = "error"; 
			swalTitle = "비밀번호 변경 과정에서 문제가 발생하였습니다"; 
			url = "changePwView";
		}
	  
		ra.addFlashAttribute("swalIcon", swalIcon); 
		ra.addFlashAttribute("swalTitle", swalTitle);
	  
		return "redirect:" + url;
	}	

	// 스프링 예외 처리
	@ExceptionHandler(Exception.class)
	public String etcException(Exception e, Model model) {
		// 특정 예외를 제외한 나머지 예외 처리
		
		e.printStackTrace();
		model.addAttribute("errorMsg", "회원 관련 서비스 처리 중 오류 발생");
		return "common/errorPage";
	}


}
