package com.kh.ehshe.member.model.service;

import com.kh.ehshe.member.model.vo.Member;

public interface MemberService {

	/** 로그인 Service
	 * @param member
	 * @return loginMember
	 */
	public abstract Member login(Member member);

}
