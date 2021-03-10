package com.kh.ehshe.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.board.model.vo.BReply;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.place.model.vo.VPReview;
import com.kh.ehshe.place.model.vo.VPlace;
import com.kh.ehshe.shop.model.vo.ItemReview;
import com.kh.ehshe.shop.model.vo.Order;
import com.kh.ehshe.shop.model.vo.QandA;
import com.kh.ehshe.shop.model.vo.ShopReply;

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
	public abstract PageInfo getPageInfo(int cp, int memberNo);
	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<VBoard> selectList(PageInfo pInfo, int memberNo);

	/**
	 * 페이징처리 (orderlist)
	 * @param cp
	 * @return
	 */
	public abstract PageInfo getOrderPageInfo(int cp);

	
	/** 페이 목록 조회 Service
	 * @param pInfo
	 * @param memberNo 
	 * @return bList
	 */
	public abstract List<Order> OrderSelectList(PageInfo pInfo, int memberNo);

	public abstract List<BReply> selectReplyList(PageInfo pInfo, int memberNo);

	public abstract List<ItemReview> selectItemReviewList(PageInfo pInfo, int memberNo);

	public abstract List<QandA> myQandA(PageInfo pInfo, int memberNo);

	public abstract List<VPlace> selectbookmarkList(PageInfo pInfo, String memberId);

	public abstract List<VPReview> selectAreaReviewList(PageInfo pInfo, int memberNo);

	public abstract List<QandA> adminQandA(PageInfo pInfo);

	public abstract int deleteCartItem(Map<String, Object> map);

	public abstract int deleteAllCartItem(Map<String, Object> map);



	
	
	
	
	
	
	
	
	
	
	
	
	
}








