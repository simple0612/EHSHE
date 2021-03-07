package com.kh.ehshe.shop.model.vo;

import java.sql.Timestamp;

public class ShopReply {
	
	private int replyNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDate;
	private Timestamp replyModifyDate;	// 댓글 수정일
	private String replyStatus;			// 댓글 상태
	private String memberId;			// 댓글 작성 회원
	private int parentBoardNo;			// 댓글이 작성된 게시글 번호
	private int parentReplyNo;			// 부모 댓글 번호
	private int replyDepth;				// 댓글 깊이

public ShopReply() {
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

public String getReplyStatus() {
	return replyStatus;
}

public void setReplyStatus(String replyStatus) {
	this.replyStatus = replyStatus;
}

public String getMemberId() {
	return memberId;
}

public void setMemberId(String memberId) {
	this.memberId = memberId;
}

public int getParentBoardNo() {
	return parentBoardNo;
}

public void setParentBoardNo(int parentBoardNo) {
	this.parentBoardNo = parentBoardNo;
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
	return "ShopReply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
			+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + ", memberId=" + memberId
			+ ", parentBoardNo=" + parentBoardNo + ", parentReplyNo=" + parentReplyNo + ", replyDepth=" + replyDepth
			+ "]";
}
	
	
}
