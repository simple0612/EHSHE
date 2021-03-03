package com.kh.ehshe.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.board.model.vo.VBReply;
import com.kh.ehshe.board.model.vo.BReply;

public interface ReplyService {

	/** 댓글 목록 조회 Service
	 * @param parentBoardNo
	 * @return rList
	 */
	public abstract List<VBReply> selectReplyList(int parentBoardNo);

	/** 댓글 삽입 Service
	 * @param map
	 * @return result
	 */
	public abstract int insertReply(Map<String, Object> map);

	/** 댓글 수정 Service
	 * @param map
	 * @return result 
	 */
	public abstract int updateReply(BReply reply);

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 */
	public abstract int deleteReply(int replyNo);

	/** 대댓글 삽입  Service
	 * @param map
	 * @return result
	 */
	public abstract int insertChildReply(Map<String, Object> map);

}
