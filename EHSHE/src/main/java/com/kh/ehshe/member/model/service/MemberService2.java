package com.kh.ehshe.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.vo.Member;

public interface MemberService2 {

	/**
	 * 개인정보수정
	 * 
	 * @param updateMember 
	 * @return
	 */
	public abstract int updateAction(Member updateMember);

	/**
	 * 비밀번호 변경 Service
	 * 
	 * @param map
	 * @return result
	 */ 
	public abstract int updatePwd(Map<String, Object> map);
 
	
	/**
	 * 비밀번호 확인하기
	 * @param map
	 * @return
	 */
	public abstract int checkPwd(Map<String, Object> map);


	/** 회원 탈퇴 Service
	 * @param memberPwd
	 * @return result
	 */
	public abstract int deleteMember(Map<String, Object> map);

	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getPageInfo(int cp);
	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<VBoard> selectList(PageInfo pInfo);


	
	
	
	
	
	
	
	
	
	
	
	
	
}








