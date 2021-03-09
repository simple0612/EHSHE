package com.kh.ehshe.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.board.model.vo.BReply;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.place.model.vo.VPlace;
import com.kh.ehshe.shop.model.vo.ItemReview;
import com.kh.ehshe.shop.model.vo.Order;
import com.kh.ehshe.shop.model.vo.QandA;
import com.kh.ehshe.shop.model.vo.ShopReply;

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

	/**
	 * 게시판 전체 게시글 수 조회 DAO 작성자 mang
	 * 
	 * @return listCount
	 */
	public int getListCount(int memberNo) {
		return sqlSession.selectOne("memberMapper2.getListCount", memberNo);
	}

	/**
	 * 게시글 목록 조회 DAO 작성자 mang
	 * 
	 * @param pInfo
	 * @return bList
	 */
	public List<VBoard> selectList(PageInfo pInfo, int memberNo) {

		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("memberMapper2.selectList", memberNo, rowBounds);
	}

	public int getOrderPageInfo() {
		return sqlSession.selectOne("memberMapper2.getOrderPageInfo");
	}

	public List<Order> OrderSelectList(PageInfo pInfo, int memberNo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("memberMapper2.orderSelectList", memberNo, rowBounds);
	}

	public List<BReply> selectReplyList(PageInfo pInfo, int memberNo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("memberMapper2.selectReplyList", memberNo, rowBounds);

	}

	public List<ItemReview> selectItemReviewList(PageInfo pInfo, int memberNo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("memberMapper2.selectItemReviewList", memberNo, rowBounds);
	}

	public List<QandA> myQandA(PageInfo pInfo, int memberNo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("memberMapper2.myQandA", memberNo, rowBounds);
	}

	public List<VPlace> selectbookmarkList(PageInfo pInfo, String memberId) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("memberMapper2.selectbookmarkList", memberId, rowBounds);
	}

}
