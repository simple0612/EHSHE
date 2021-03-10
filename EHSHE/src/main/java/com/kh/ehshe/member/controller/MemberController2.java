package com.kh.ehshe.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ehshe.board.model.vo.BReply;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.service.MemberService2;
import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.place.model.vo.VPlace;
import com.kh.ehshe.shop.model.vo.ItemReview;
import com.kh.ehshe.shop.model.vo.Order;
import com.kh.ehshe.shop.model.vo.QandA;
import com.kh.ehshe.shop.model.vo.ShopReply;

@Controller // 프레젠테이션 레이어, 웹 애플리케이션 전달된 요청 응답을 처리하는 클래스 + bean 등록
@RequestMapping("/page/*")
@SessionAttributes({ "loginMember" })

public class MemberController2 {

	@Autowired // 해당 자료형과 일치하는 bean을 의존성주입(DI)
	private MemberService2 service;

	private String swalIcon;
	private String swalTitle;
	private String swalText;

	/**
	 * 마이페이지로 이동하기
	 * 
	 * @return
	 */
	@RequestMapping("mypagemain")
	public String mypagemain() {
		return "member/mypagemain";
	}

	
	@RequestMapping("adminpage")
	public String adminpage() {
		return "member/adminpage";
	}
	@RequestMapping("checkpassward")
	public String checkpassward() {
		return "member/checkpassward";
	}

	/**
	 * 비밀번호 체크하기
	 * 
	 * @return
	 */
	@RequestMapping(value = "checkPwd", method = RequestMethod.POST) // method 안쓰면 자동으로 받아옴
	public String checkPwd(@RequestParam("memberPwd") String memberPwd,
			@ModelAttribute(name = "loginMember", binding = false) Member loginMember, RedirectAttributes ra) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberPwd", memberPwd);

		map.put("memberNo", loginMember.getMemberNo());

		int result = service.checkPwd(map);

		String returnURL = null;
		if (result > 0) {

			returnURL = "memberopstion";

		} else {
			swalIcon = "error";
			swalTitle = "비밀번호가 일치하지 않습니다";
			returnURL = "checkpassward";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return "redirect:" + returnURL;
	}	

	@RequestMapping("memberopstion")
	public String memberopstion() {
		return "member/memberopstion";
	}

	/**
	 * 마이페이지로이동
	 * 
	 * @return
	 */
	@RequestMapping("mypage")
	public String mypage() {
		return "member/mypage";
	}

	// 내 정보 수정 Controller

	@RequestMapping(value = "updateAction", method = RequestMethod.POST) // method 안쓰면 자동으로 받아옴
	public String updateAction(@ModelAttribute Member updateMember, Model model, RedirectAttributes ra,
			@ModelAttribute(name = "loginMember", binding = false) Member loginMember) {

		Member loginMember1 = (Member) model.getAttribute("loginMember");

		

		updateMember.setMemberNo(loginMember1.getMemberNo());

		int result = service.updateAction(updateMember);

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "회원 정보 수정 성공";

			loginMember1.setMemberEmail(updateMember.getMemberEmail());
			loginMember1.setMemberPhone(updateMember.getMemberPhone());
			loginMember1.setMemberAddr(updateMember.getMemberAddr());

			model.addAttribute("loginMember", loginMember1);

		} else {
			swalIcon = "error";
			swalTitle = "회원 정보 수정 실패";
			swalText = "회원 정보 수정 과정에서 문제가 발생하였습니다";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);

		// 마이페이지 재요청
		return "redirect:mypage";
	}

	// 비밀번호 변경 화면 전환용 Controller
	@RequestMapping("changePwd")
	public String changePwd() {
		return "member/changePwd";
	}

	// 비밀번호 변경 Controller
	@RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(@RequestParam("memberPwd") String memberPwd, @RequestParam("newPwd1") String newPwd,
			@ModelAttribute(name = "loginMember", binding = false) Member loginMember, RedirectAttributes ra) {

		// Map을 이용하여 필요한 데이터를 하나로 묶어둠
		// Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberPwd", memberPwd);
		map.put("newPwd", newPwd);
		map.put("memberNo", loginMember.getMemberNo());

		// 비밀번호 변경 Service 호출
		int result = service.updatePwd(map);

		// 재요철할 주소 저장 변수 선언
		String returnURL = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "비밀번호 변경 성공";
			returnURL = "mypage";

		} else {
			swalIcon = "error";
			swalTitle = "비밀번호 변경 과정에서 문제가 발생하였습니다";
			returnURL = "changePwd";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return "redirect:" + returnURL;
	}

	// 삭제 페이지 이동
	@RequestMapping("deletemember")
	public String deletemember() {
		return "member/deletemember";
	}

	// 삭제 감사 안내
	@RequestMapping("deletememberfinal")
	public String deletememberfinal() {
		return "member/deletememberfinal";
	}

	// 회원 탈퇴 Controller
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public String deleteMember(@RequestParam("memberPwd") String memberPwd,
			@ModelAttribute(name = "loginMember", binding = false) Member loginMember, RedirectAttributes ra,
			SessionStatus status) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberPwd", memberPwd);

		map.put("memberNo", loginMember.getMemberNo());

		int result = service.deleteMember(map);

		String returnURL = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "탈퇴되었습니다";
			returnURL = "deletememberfinal";

			// 회원 탈퇴 성공 시 로그아웃
			status.setComplete();

		} else {
			swalIcon = "error";
			swalTitle = "회원 탈퇴 과정에서 문제가 발생하였습니다";
			returnURL = "deletemember";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return "redirect:" + returnURL;
	}

	@RequestMapping("paymentdetails")
	public String paymentdetails(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		PageInfo pInfo = service.getOrderPageInfo(cp);

		// 주문내역 죄회
		List<Order> OList = service.OrderSelectList(pInfo, memberNo);

		model.addAttribute("OList", OList);
		model.addAttribute("pInfo", pInfo);

		return "member/paymentdetails";
	}

	@RequestMapping("bookmark")
	public String bookmark(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		
		String MemberId = loginMember.getMemberId();
		
		PageInfo pInfo = service.getPageInfo(cp,memberNo);

		List<VPlace> bookList = service.selectbookmarkList(pInfo, MemberId);

		

		
		model.addAttribute("bookList", bookList);
		model.addAttribute("pInfo", pInfo);

		
		
		return "member/bookmark";
	}

	@RequestMapping("mywrite")
	public String mywrite() {
		return "member/mywrite";
	}

	@RequestMapping("myQandA")
	public String myQandA(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		PageInfo pInfo = service.getOrderPageInfo(cp);

		//QANDA조회
		List<QandA> QList = service.myQandA(pInfo, memberNo);
	
		model.addAttribute("QList", QList);
		model.addAttribute("pInfo", pInfo);
		return "member/myQandA";
	}
	
	
	
	@RequestMapping("adminQandA")
	public String adminQandA(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		
		PageInfo pInfo = service.getOrderPageInfo(cp);

		//QANDA조회
		List<QandA> QList = service.adminQandA(pInfo);
		
		System.out.println(QList);
		model.addAttribute("QList", QList);
		model.addAttribute("pInfo", pInfo);
		return "member/adminQandA";
	}
	
	
	
	

	@RequestMapping("review")
	public String review(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		PageInfo pInfo = service.getPageInfo(cp,memberNo);
	
		List<ItemReview> ItemReview = service.selectItemReviewList(pInfo, memberNo);

		//List<BReply> BReply = service.selectReplyList(pInfo, memberNo);

		
		//model.addAttribute("bList", ItemReview);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("ItemReview", ItemReview);
		System.out.println(ItemReview);
		return "member/review";
	}

	@RequestMapping("bulletin")
	public String bulletin(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model,
			@ModelAttribute("loginMember") Member loginMember) {

		int memberNo = loginMember.getMemberNo();
		PageInfo pInfo = service.getPageInfo(cp,memberNo);

		List<VBoard> bList = service.selectList(pInfo, memberNo);

		List<BReply> BReply = service.selectReplyList(pInfo, memberNo);

		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("BReply", BReply);

		
		
		return "member/bulletin";
	}

}
