package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.shop.model.vo.ShopBuying;
import com.kh.ehshe.shop.model.vo.ShopReview;

public interface ShopReviewService {

	
   public abstract List<ShopReview> selectReplyList(int itemNo);

		/*
		 * public abstract int insertReply(Map<String, Object> map);
		 */
	  /** 업데이트
	 * @param reply
	 * @return
	 */
	// public abstract int updateReply(ShopReview reply);

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 */
	// public abstract int deleteReply(int replyNo);

	/** 대댓글 삽입 Service
	 * @param map
	 * @return result
	 */
	//public abstract int insertChildReply(Map<String, Object> map);

	
	
	/** 옵션상세번호 조회하기
	 * @param map
	 * @return sbList
	 */
	public abstract List<ShopBuying> selectOptionSpecifyNoList(Map<String, Object> map);

	
	
	/** 리뷰 작성 
	 * @param sbList
	 * @return result
	 */
	public abstract int insertReview(Map<String, Object> map);

	/** 리뷰 수정
	 * @param reply
	 * @return result
	 */
	public abstract int updateReply(Map<String, Object> map);

	/** 리뷰삭제
	 * @param replyNo
	 * @return result
	 */
	public abstract int deleteReply(int replyNo);
	  
	  
	  //map으로 했을 때
	  //public abstract int updateReply(Map<String, Object> map);
	 
}
