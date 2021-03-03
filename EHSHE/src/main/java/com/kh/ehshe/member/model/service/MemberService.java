package com.kh.ehshe.member.model.service;

import java.util.HashMap;
import java.util.Map;

import com.kh.ehshe.member.model.vo.Member;

public interface MemberService {

	/** 로그인 Service
	 * @param member
	 * @return loginMember
	 */
	public abstract Member login(Member member);

	/** 아이디 중복 검사 Service
	 * @param memberId
	 * @return result
	 */
	public abstract int idDupCheck(String memberId);

	/** 회원가입 Service
	 * @param signUpMember
	 * @return result
	 */
	public abstract int signUp(Member signUpMember);

	/** 아이디 찾기 (이름/이메일 일치 여부) Service
	 * @param member
	 * @return result
	 */
	public abstract int checkMemberInfo(Member member);

	/** 아이디 찾기 (조회) Service
	 * @param member
	 * @return memberInfo
	 */
	public abstract Member findId(Member member);

	/** 비밀번호 찾기 (아이디/이메일 일치 여부) Service
	 * @param member
	 * @return result
	 */
	public abstract int checkMemberPw(Member member);

	/** 비밀번호 찾기 (조회) Service
	 * @param member
	 * @return memberInfo2
	 */
	public abstract Member findPw(Member member);

	/** 비밀번호 변경 Service
	 * @param map
	 * @return result
	 */
	public abstract int updatePw(Map<String, Object> map);

	/** 카카오 회원 등록 Service
	 * @param kakaoInfo
	 * @return result
	 */
	public abstract int kakaoSignUp(Member member);

	/** 카카오 로그인 Service
	 * @param memberId
	 * @return
	 */
	public abstract Member KaKaoLogin(Member member);

}
