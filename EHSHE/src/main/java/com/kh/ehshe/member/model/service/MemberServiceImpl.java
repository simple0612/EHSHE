package com.kh.ehshe.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ehshe.member.model.dao.MemberDAO;
import com.kh.ehshe.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	/*
	 * @Autowired private BCryptPasswordEncoder enc;
	 */
	
	// 로그인 Service
	@Override
	public Member login(Member member) {
	
		Member loginMember = dao.login(member);
		
		/*
		 * if(loginMember != null) {
		 * 
		 * // 비밀번호가 같을 때 if( enc.matches(member.getMemberPw(), loginMember.getMemberPw()
		 * )) {
		 * 
		 * loginMember.setMemberPw(null);
		 * 
		 * } else {
		 * 
		 * loginMember = null; } }
		 */		
		return loginMember;
	}
}
