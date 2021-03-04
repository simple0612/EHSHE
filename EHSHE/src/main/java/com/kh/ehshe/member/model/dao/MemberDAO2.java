package com.kh.ehshe.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.board.model.vo.Attachment;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
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



	/**	게시판 전체 게시글 수 조회 DAO
	 * 작성자 mang
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("memberMapper2.getListCount");
	}

	
	/** 게시글 목록 조회 DAO
	 * 작성자 mang
	 * @param pInfo
	 * @return bList
	 */
	public List<VBoard> selectList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("memberMapper2.selectList", null, rowBounds);
	}

	/** 게시글 목록 썸네일 조회 DAO
	 * 작성자 mang
	 * @param bList
	 * @return thumbnailList
	 */
	public List<Attachment> selectThumbnailList(List<VBoard> bList) {
		return sqlSession.selectList("memberMapper2.selectThumbnailList", bList);
	}



}
