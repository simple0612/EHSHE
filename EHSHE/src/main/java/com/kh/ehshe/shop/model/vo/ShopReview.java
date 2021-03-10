package com.kh.ehshe.shop.model.vo;

import java.sql.Timestamp;

public class ShopReview {
	private int replyNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDate;	// 댓글 작성일
	private Timestamp replyModifyDate;	// 댓글 수정일
	private String replyStatus;			// 댓글 상태
	private String memberId;			// 댓글 작성 회원
	private int parentReplyNo;			// 부모 댓글 번호
	private int itemRating; 
	private int memberNo; 		
	
	// 별점
	public ShopReview() {
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

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public int getItemRating() {
		return itemRating;
	}

	public void setItemRating(int itemRating) {
		this.itemRating = itemRating;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "ShopReview [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreateDate="
				+ replyCreateDate + ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus
				+ ", memberId=" + memberId + ", parentReplyNo=" + parentReplyNo + ", itemRating=" + itemRating
				+ ", memberNo=" + memberNo + "]";
	}


	

	
}
