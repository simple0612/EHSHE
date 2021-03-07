package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.ehshe.shop.model.vo.ShopReply;

@Service
public interface ShopReplyService {

	
	  public abstract List<ShopReply> selectRepltList(int parentBoardNo);

	   public abstract int insertReply(Map<String, Object> map);

	  /** 업데이트
	 * @param reply
	 * @return
	 */
	public abstract int updateReply(ShopReply reply);

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 */
	public abstract int deleteReply(int replyNo);

	/** 대댓글 삽입 Service
	 * @param map
	 * @return result
	 */
	public abstract int insertChildReply(Map<String, Object> map);
	  
	  
	  //map으로 했을 때
	  //public abstract int updateReply(Map<String, Object> map);
	 
	}

