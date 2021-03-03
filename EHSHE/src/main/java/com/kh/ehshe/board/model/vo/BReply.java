package com.kh.ehshe.board.model.vo;

import java.sql.Timestamp;

public class BReply {
	
	private int replyNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDate;	// 댓글 작성일
	private Timestamp replyModifyDate;	// 댓글 수정일
	private String replyDeleteFl;			// 댓글 상태
	private String memberNo;			// 댓글 작성 회원
	private int boardNo;			// 댓글이 작성된 게시글 번호
	private int parentReplyNo;			// 부모 댓글 번호
	private int replyDepth;				// 댓글 깊이
	
	public BReply() {}

	public BReply(int replyNo, String replyContent, Timestamp replyCreateDate, Timestamp replyModifyDate,
			String replyDeleteFl, String memberNo, int boardNo, int parentReplyNo, int replyDepth) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyDeleteFl = replyDeleteFl;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.parentReplyNo = parentReplyNo;
		this.replyDepth = replyDepth;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Timestamp replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Timestamp getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Timestamp replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplyDeleteFl() {
		return replyDeleteFl;
	}

	public void setReplyDeleteFl(String replyDeleteFl) {
		this.replyDeleteFl = replyDeleteFl;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public int getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyDeleteFl=" + replyDeleteFl + ", memberNo=" + memberNo
				+ ", boardNo=" + boardNo + ", parentReplyNo=" + parentReplyNo + ", replyDepth=" + replyDepth + "]";
	}

	
	
}
