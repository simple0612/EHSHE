package com.kh.ehshe.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.member.model.dao.MemberDAO;
import com.kh.ehshe.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder enc;
	 
	
	// 로그인 Service 구현
	@Override
	public Member login(Member member) {
	
		Member loginMember = dao.login(member);
				
		if(loginMember != null) {
			
			// 비밀번호가 같을 때
			if( enc.matches(member.getMemberPw(), // 입력받은 평문 비밀번호
							loginMember.getMemberPw() )) { // DB에 저장된 암호화 비밀번호
				
				// DB에서 조회된 회원 정보를 반환하면 되지만 
				// 비밀번호는 null 값으로 변경해서 내보냄 (보안을 위해)
				loginMember.setMemberPw(null);
				
			} else { // 비밀번호가 다를 때
				
				// 로그인이 실패한 모양을 만들어
				loginMember = null;
			}
		}
		return loginMember;
	}
	
	// 아이디 중복 검사 Service 구현
	@Override
	public int idDupCheck(String memberId) {
		return dao.idDupCheck(memberId);
	}

	// 회원 가입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) {
		
		// 암호화 추가
		// DAO 전달 전에 비밀번호 암호화
		String encPw = enc.encode(signUpMember.getMemberPw());
		
		// 암호화된 비밀번로를 signUpMember에 다시 세팅
		signUpMember.setMemberPw(encPw);
		
		return dao.signUp(signUpMember);
	}
	
	// 아이디 찾기 (이름/이메일  일치 여부) Service 구현
	@Override
	public int checkMemberInfo(Member member) {
		return dao.checkMemberId(member);
	}

	// 아이디 찾기 (조회) Service 구현
	@Override
	public Member findId(Member member) {
		return dao.findId(member);
	}

	// 비밀번호 찾기 (아이디/이메일 일치 여부) Service 구현
	@Override
	public int checkMemberPw(Member member) {
		return dao.checkMemberPw(member);
	}


	// 비밀번호 찾기 (조회) Service
	@Override
	public Member findPw(Member member) {
		return dao.findPw(member);
	}
	
	
	// 비밀번호 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePw(Map<String, Object> map) {
		
		String encPw = enc.encode((String)map.get("newPw"));
		map.put("newPw", encPw);

		int result = dao.updatePw(map);

		return result;
	}
	
}
	
