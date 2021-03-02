package com.kh.ehshe.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.member.model.vo.Member;

@Repository
public class MemberDAO2 {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 회원 정보 수정 DAO
	 * 
	 * @param updateMember
	 * @return result
	 */
	public int updateAction(Member updateMember) {
		return sqlSession.update("memberMapper2.updateAction", updateMember);
	}
 
	/**
	 * 비밀번호 조회 DAO
	 * 
	 * @param memberNo
	 * @return savePwd
	 */
	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper2.selectPwd", memberNo);
	}

	/**
	 * 비밀번호 수정 DAO
	 * 
	 * @param map
	 * @return result
	 */
	public int updatePwd(Map<String, Object> map) {
		return sqlSession.update("memberMapper2.updatePwd", map);
	}

	public int deleteMember(Map<String, Object> map) {
		return sqlSession.update("memberMapper2.deleteMember", map);
	}


}
