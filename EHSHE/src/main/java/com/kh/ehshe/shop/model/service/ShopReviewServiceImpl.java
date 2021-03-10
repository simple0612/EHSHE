package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.shop.model.dao.ShopReviewDAO;
import com.kh.ehshe.shop.model.vo.ShopBuying;
import com.kh.ehshe.shop.model.vo.ShopReview;

@Service
public class ShopReviewServiceImpl implements ShopReviewService {


	@Autowired // 등록된 Bean 중 타입이 일치하는 Bean을 자동으로 의존성 주입
	private ShopReviewDAO dao;

	
	// 댓글 목록 조회 Service 구현
	@Override
	public List<ShopReview> selectReplyList(int itemNo) {
		return dao.selectReplyList(itemNo);
	}


// 옵션상세번호 조회하기

@Override
public List<ShopBuying> selectOptionSpecifyNoList(Map<String, Object> map) {
	return dao.selectOptionSpecifyNoList(map);
}


/**
 * shop 리뷰 등록
 */
@Transactional(rollbackFor = Exception.class)
@Override
public int insertReview(Map<String, Object> map) {
			
			
	  map.put("replyContent", replaceParameter( (String)map.get("replyContent")) );
		      
		      // ajax로 textarea 내용을 얻어올 경우 개행문자가 \n으로 취급됨.
		      // 개행문자 처리 \n -> <br>
      map.put("replyContent", ((String)map.get("replyContent")).replaceAll("\n", "<br>") );
			
			
			
			return dao.insertReview(map);
		}

		/**
		 *  shop 리뷰 수정
		 */ 
		// 댓글 수정 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updateReply(Map<String, Object> map) {
				
		  map.put("replyShopContent", replaceParameter( (String)map.get("replyShopContent")) );
	      map.put("replyShopContent", ((String)map.get("replyShopContent")).replaceAll("\n", "<br>") );
			
			
			return dao.updateReply(map);
		}

		
		
		// 크로스 사이트 스크립트 방지 메소드
		private String replaceParameter(String param) {
			String result = param;
			if(param != null) {
				result = result.replaceAll("&", "&amp;");
				result = result.replaceAll("<", "&lt;");
				result = result.replaceAll(">", "&gt;");
				result = result.replaceAll("\"", "&quot;");
			}
			
			return result;
		}


		@Override
		public int deleteReply(int replyNo) {
			return dao.deleteReply(replyNo);
		}


	
	
	
}
