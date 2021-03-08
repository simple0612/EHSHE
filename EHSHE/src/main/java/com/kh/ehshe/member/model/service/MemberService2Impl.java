package com.kh.ehshe.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.board.model.vo.BReply;
import com.kh.ehshe.board.model.vo.PageInfo;
import com.kh.ehshe.board.model.vo.VBoard;
import com.kh.ehshe.member.model.dao.MemberDAO2;
import com.kh.ehshe.member.model.vo.Member;
import com.kh.ehshe.shop.model.vo.ItemReview;
import com.kh.ehshe.shop.model.vo.Order;
import com.kh.ehshe.shop.model.vo.ShopReply;

@Service
public class MemberService2Impl implements MemberService2 {

	@Autowired
	private MemberDAO2 dao;

	// 암호화를 위한 객체를 의존성 주입(DI)
	@Autowired
	private BCryptPasswordEncoder enc;

	// 회원 정보 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAction(Member updateMember) {
		return dao.updateAction(updateMember);
	}

	// 비밀번호 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePwd(Map<String, Object> map) {
		// 현재 비밀번호, 새 비밀번호, 회원 번호

		// 1. 현재 비밀번호가 일치하는지 확인 (본인확인)
		// bcyrpt 암호화가 적용되어 있기 때문에
		// DB에서 비밀번호를 조회해서 비교해야 함 == 현재 비밀번호 조회 dao 필요
		String savePwd = dao.selectPwd((int) map.get("memberNo"));

		// 결과 저장용 변수 선언
		int result = 0;

		if (savePwd != null) { // 비밀번호 조회 성공 시

			// 비밀번호 확인
			if (enc.matches((String) map.get("memberPwd"), savePwd)) {
				// 비밀번호가 일치할 경우

				// 2. 현재 비밀번호 일치 확인 시 새 비밀번호로 변경
				// == 비밀번호를 수정할 dao 필요

				// 새 비밀번호 암호화 진행
				String encPwd = enc.encode((String) map.get("newPwd"));

				// 암호화된 비밀번호를 다시 map에 세팅
				map.put("newPwd", encPwd);

				// 비밀번호 수정 DAO 호출
				result = dao.updatePwd(map);

			}
		}

		return result;
	}

	/**
	 * 비밀번호 확인하기
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int checkPwd(Map<String, Object> map) {
		String savePwd = dao.selectPwd((int) map.get("memberNo"));
		// 결과 저장용 변수 선언
		int result = 0;

		if (savePwd != null) { // 비밀번호 조회 성공 시

			if (enc.matches((String) map.get("memberPwd"), savePwd)) {

				result = 1;

			}

		}

		return result;
	}

	// 회원 탈퇴 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteMember(Map<String, Object> map) {

		String savePwd = dao.selectPwd((int) map.get("memberNo"));

		// 결과 저장용 변수 선언
		int result = 0;

		if (savePwd != null) { // 비밀번호 조회 성공 시

			// 비밀번호 확인
			if (enc.matches((String) map.get("memberPwd"), savePwd)) {

				result = dao.deleteMember(map);

			}
		}

		return result;
	}

	// 게시판 전체 게시글수 조회 Service 구현
	@Override
	public PageInfo getPageInfo(int cp, int memberNo) {

		int listCount = dao.getListCount(memberNo);

		return new PageInfo(cp, listCount);
	}

	// 결제주문 목록 조회 service 구현
	@Override
	public List<VBoard> selectList(PageInfo pInfo,int memberNo) {
		return dao.selectList(pInfo,memberNo);
	}

	// 주문내역 다조회
	@Override
	public PageInfo getOrderPageInfo(int cp) {
		int listCount = dao.getOrderPageInfo();

		return new PageInfo(cp, listCount);
	}

	// 주문내역 조회리스트
	@Override
	public List<Order> OrderSelectList(PageInfo pInfo,int memberNo) {
		return dao.OrderSelectList(pInfo,memberNo);
		
	}

	//댓글 조회 리스트
	@Override
	public List<BReply> selectReplyList(PageInfo pInfo, int memberNo) {
		return dao.selectReplyList(pInfo,memberNo);
	}
	
	
	//아이템 리스트 조회 내가결제한 거 만 출력가능
	@Override
	public List<ItemReview> selectItemReviewList(PageInfo pInfo, int memberNo) {
		return dao.selectItemReviewList(pInfo,memberNo);
	}

	@Override
	public List<ShopReply> myQandA(PageInfo pInfo, int memberNo) {
		return dao.myQandA(pInfo,memberNo);
	}

}
