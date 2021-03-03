package com.kh.ehshe.board.model.vo;

import java.sql.Timestamp;

public class VBReply {
	private int replyNo; 		 		
	private String replyContent; 		
	private Timestamp replyCreateDate;
	private Timestamp replyModifyDate;
	private String replyDeleteFl;		
	private String memberNo;			
	private String memberId;			
	private int boardNo;			
	private int parentReplyNo;			
	private int replyDepth;			
	
	public VBReply() {}

	public VBReply(int replyNo, String replyContent, Timestamp replyCreateDate, Timestamp replyModifyDate,
			String replyDeleteFl, String memberNo, String memberId, int boardNo, int parentReplyNo, int replyDepth) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyDeleteFl = replyDeleteFl;
		this.memberNo = memberNo;
		this.memberId = memberId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "VReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyDeleteFl=" + replyDeleteFl + ", memberNo=" + memberNo
				+ ", memberId=" + memberId + ", boardNo=" + boardNo + ", parentReplyNo=" + parentReplyNo
				+ ", replyDepth=" + replyDepth + "]";
	}

	
	
	
}
