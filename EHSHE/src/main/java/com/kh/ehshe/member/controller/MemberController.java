package com.kh.ehshe.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
@SessionAttributes({"loginMember", "kakaoMember", "memberInfo", "memberInfo2"}) // Model에 추가된 데이터 중 key 값이 해당 어노테이션에 적혀있는 값과 일치하는 데이터를 session scope로 이동
public class MemberController {

	// Spring에서는 객체의 생명주기를 Spring Container가 관리할 수 있도록 함
	// == bean으로 등록하여 IOC를 통해 제어
	
	// 빈 스캐닝(component-scan)을 통해 등록된 bean 중 알맞은 bean을 해당 변수에
	// 의존성 주입(DI)를 진행함
	
	@Autowired
	private MemberService service;
	
    @Autowired
    private JavaMailSender mailSender;

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
						HttpServletResponse response, Model model, RedirectAttributes ra) {
		
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
			ra.addFlashAttribute("swalTitle", "EHSHE");
			ra.addFlashAttribute("swalText", "EHSHE 계정 정보가 일치하지 않습니다. 다시 확인해 주세요.");
			
			// 실패 시 로그인 화면으로 재요청 
			url = "loginView";
		}
		
		return "redirect:" + url;
	}
	
	// 카카오 로그인 Controller
	@ResponseBody
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
	public Member kakaoLogin(@RequestParam String memberId,
							 @RequestParam String memberPw,
   							 @RequestParam String memberNm,
   							 Model model) {

		// 아이디 중복 검사
		int result = service.idDupCheck(memberId);
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberNm(memberNm);
		
		Member loginMember = null;
		
		if(result > 0) {						
			loginMember = service.KaKaoLogin(member); 
			//System.out.println("이미 등록 되어 있는 경우 : " + loginMember);
				
		} else {
			//System.out.println("등록 x");
			
			member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberNm(memberNm);			

			int kakaoReg = service.kakaoSignUp(member); 
			
			//System.out.println(kakaoReg);
			//System.out.println(member);

			if(kakaoReg > 0) {
				loginMember = service.KaKaoLogin(member); 
				//System.out.println("회원 등록 후 : " + loginMember);				
			}
		}
		model.addAttribute("loginMember", loginMember);				
		
		return loginMember;			
	}
	
	// 구글 로그인 Controller
    @ResponseBody
	@RequestMapping(value = "/googleLogin", method = RequestMethod.POST)
	public Member googleLogin(@RequestParam String memberId,
							  @RequestParam String memberNm,
							  Model model) {

		// 아이디 중복 검사
    	int result = service.idDupCheck(memberId);
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberNm(memberNm);
		
		System.out.println(member);
		
		Member loginMember = null;
		
		if(result > 0) {						
			loginMember = service.googleLogin(member); 
			//System.out.println("이미 등록 되어 있는 경우 : " + loginMember);
				
		} else {
			//System.out.println("등록 x");
			
			member = new Member();
			member.setMemberId(memberId);
			member.setMemberNm(memberNm);			

			int googleReg = service.googleSignUp(member); 
			
			//System.out.println(kakaoReg);
			//System.out.println(member);

			if(googleReg > 0) {
				loginMember = service.googleLogin(member); 
				//System.out.println("회원 등록 후 : " + loginMember);				
			}
		}
		model.addAttribute("loginMember", loginMember);				
		
		return loginMember;			
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
			System.out.println(memberInfo);
			
			if(memberInfo != null) {
				model.addAttribute("memberInfo", memberInfo);
			}
			
			url = "findIdCompleteView";
		
		} else {
			url = "findIdView";
			
			swalTitle = "EHSHE";
			swalText = "입력하신 정보와 일치하는 계정이 없습니다.";
		}
		
		
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);
		
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
			
			swalTitle = "EHSHE";
			swalText = "입력하신 정보와 일치하는 계정이 없습니다.";
		}
		
		ra.addFlashAttribute("swalTitle", swalTitle);
		ra.addFlashAttribute("swalText", swalText);
		
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
			swalTitle = "EHSHE"; 
			swalText = "비밀번호 변경 성공"; 
			url = "loginView";
	  
		} else { 
			swalTitle = "EHSHE"; 
			swalText = "비밀번호 변경 과정에서 문제가 발생하였습니다"; 
			url = "changePwView";
		}
	  
		ra.addFlashAttribute("swalTitle", swalTitle); 
		ra.addFlashAttribute("swalText", swalText);
	  
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


    // 이메일 인증	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
    public String mailCheck(String email) throws Exception {
        
        // ajax로부터 넘어온 데이터 확인 
    	//System.out.println("이메일 데이터 전송 확인");
        //System.out.println("인증번호 : " + email);

        // 인증번호(난수) 생성 
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 " + checkNum);

        // 이메일 보내기
        String setFrom = "EHSHE" + " <ehshetest01@gmail.com>";
        String toMail = email;
        String title = "EHSHE 회원 인증 메일 입니다.";
        String content = 
        		"<img src =\'https://i.postimg.cc/RF1MFDnG/emailImg.jpg\'>" +
                "<br><br>" + "안녕하세요." + 
                "<br>" + "<span style = 'font-weight : bold'>" + " EHSHE " + "</span>" + "에 방문해주셔서 감사합니다!" +
                "<br><br>" + 
                "인증 번호는 " + "<span style = 'font-weight : bold'>" + checkNum + "</span>" + "입니다." + 
                "<br>" + "해당 번호를 이메일 인증 입력란에 입력해 주세요.";
        
         try {
        	
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	        // true는 멀티파트 메세지를 사용하겠다는 의미
	        // 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
	        // MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	        
	        // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	        // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	        //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	        helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true); // true는 html을 사용하겠다는 의미입니다.
	        mailSender.send(message);
	                
	        //단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
        } catch(Exception e) {
        	e.printStackTrace();
        } 
        
        String num = Integer.toString(checkNum);
        
        return num;
    }

 
}
