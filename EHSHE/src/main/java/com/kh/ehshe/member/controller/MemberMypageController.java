package com.kh.ehshe.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/page/*")
public class MemberMypageController {

	/**
	 * 마이페이지로 이동하기
	 * 
	 * @return
	 */
	@RequestMapping("mypagemain")
	public String mypagemain() {
		return "member/mypagemain";
	}

	/**
	 * 비밀번호 체그하기
	 * 
	 * @return
	 */
	@RequestMapping("checkpassward")
	public String checkpassward() {
		return "member/checkpassward";
	}

	@RequestMapping("mypage")
	public String mypage() {
		return "member/mypage";
	}

	@RequestMapping("deletemember")
	public String deletemember() {
		return "member/deletemember";
	}

	@RequestMapping("deletememberfinal")
	public String deletememberfinal() {
		return "member/deletememberfinal";
	}

	@RequestMapping("paymentdetails")
	public String paymentdetails() {
		return "member/paymentdetails";
	}
	
	@RequestMapping("bookmark")
	public String bookmark() {
		return "member/bookmark";
	}


	@RequestMapping("mywrite")
	public String mywrite() {
		return "member/mywrite";
	}


	
	@RequestMapping("myQandA")
	public String myQandA() {
		return "member/myQandA";
	}
	
	@RequestMapping("review")
	public String review() {
		return "member/review";
	}
	
	@RequestMapping("bulletin")
	public String bulletin() {
		return "member/bulletin";
	}
	
	
}
