package com.kh.ehshe.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 로그인 DAO
	 * @param member
	 * @return loginMember
	 */
	public Member login(Member member) {
		return sqlSession.selectOne("memberMapper.login", member);
	}


	/** 아이디 중복 검사 DAO
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
	}


	/** 회원 가입 DAO
	 * @param signUpMember
	 * @return result
	 */
	public int signUp(Member signUpMember) {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 아이디 찾기 (이름/이메일 일치 여부) DAO
	 * @param map
	 * @return result
	 */
	public int checkMemberId(Member member) {
		return sqlSession.selectOne("memberMapper.checkMemberId", member);
	}

	/** 아이디 찾기 (조회) DAO
	 * @param member
	 * @return memberId
	 */
	public Member findId(Member member) {
		return sqlSession.selectOne("memberMapper.findId", member);
	}

	/** 비밀번호 찾기 (아이디/이메일 일치 여부) DAO
	 * @param member
	 * @return result
	 */
	public int checkMemberPw(Member member) {
		return sqlSession.selectOne("memberMapper.checkMemberPw", member);
	}

	/** 비밀번호 찾기 (조회) DAO
	 * @param member
	 * @return
	 */
	public Member findPw(Member member) {
		return sqlSession.selectOne("memberMapper.findPw", member);
	}

	/** 비밀번호 변경 DAO
	 * @param map
	 * @return result
	 */
	public int updatePw(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updatePw", map);
	}

}
