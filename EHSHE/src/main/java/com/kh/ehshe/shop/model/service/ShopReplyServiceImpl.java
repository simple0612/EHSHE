package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.shop.model.dao.ShopReplyDAO;
import com.kh.ehshe.shop.model.vo.ShopReply;

@Service // Service + Bean 등록
public class ShopReplyServiceImpl  implements ShopReplyService{

	
	@Autowired // 등록된 Bean 중 타입이 일치하는 Bean을 자동으로 의존성 주입
	private ShopReplyDAO dao;

	
	// 댓글 목록 조회 Service 구현
	@Override
	public List<ShopReply> selectRepltList(int parentBoardNo) {
		return dao.selectReplyList(parentBoardNo);
	}


	// 댓글 삽입  Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Map<String, Object> map) {
		
	      // 크로스 사이트 스크립팅 방지
	      map.put("replyContent", replaceParameter( (String)map.get("replyContent")) );
	      
	      // ajax로 textarea 내용을 얻어올 경우 개행문자가 \n으로 취급됨.
	      // 개행문자 처리 \n -> <br>
	      map.put("replyContent", ((String)map.get("replyContent")).replaceAll("\n", "<br>") );
		
		return dao.insert(map);
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

		// 댓글 수정 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updateReply(ShopReply reply) {
			
			// 크로스사이트 스크립팅 처리
			reply.setReplyContent(replaceParameter(reply.getReplyContent()) );
			
			// 개행문자 처리
			reply.setReplyContent(reply.getReplyContent().replaceAll("\n", "<br>"));
			
			return dao.updateReply(reply);
		}
	
		// 내가 한 버전
		/*// 댓글 수정 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int updateReply(Map<String, Object> map) {
		      map.put("replyContent", replaceParameter( (String)map.get("replyContent")) );
		      map.put("replyContent", ((String)map.get("replyContent")).replaceAll("\n", "<br>") );

			return dao.updateReply(map);
		}*/


		// 댓글 삭제 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int deleteReply(int replyNo) {
			return dao.deleteReply(replyNo);
		}

		// 대댓글 삽입 Service 구현
		@Transactional(rollbackFor=Exception.class)
		@Override
		public int insertChildReply(Map<String, Object> map) {
			  // 크로스 사이트 스크립팅 방지 처리
		      map.put("replyContent", replaceParameter( (String)map.get("replyContent")) );
		      
		      // ajax로 textarea 내용을 얻어올 경우 개행문자가 \n으로 취급됨.
		      // 개행문자 처리 \n -> <br>
		      map.put("replyContent", ((String)map.get("replyContent")).replaceAll("\n", "<br>") );
			
			return dao.insertChildReply(map);
		}
	
	
	
		
}
