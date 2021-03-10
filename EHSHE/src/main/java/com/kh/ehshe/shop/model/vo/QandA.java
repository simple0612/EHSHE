package com.kh.ehshe.shop.model.vo;

import java.sql.Timestamp;

public class QandA {

	
	private int qaNo; 		 		// 댓글 번호
	private String replyContent; 		// 댓글 내용
	private Timestamp replyCreateDate;
	private Timestamp replyModifyDate;	// 댓글 수정일
	private String replyStatus;			// 댓글 상태
	private String memberId;			// 댓글 작성 회원
	private int parentBoardNo;			// 댓글이 작성된 게시글 번호
	private int parentReplyNo;			// 부모 댓글 번호
	
	private int replyDepth;				// 댓글 깊이
	
	private int itemNo;
	private String itemContent;
	private String itemNm;
	private int itemPrice;
	private int transCharge;
	private String itemDeleteFl;
	private String itemCategory;
	
	
	
public QandA() {
	// TODO Auto-generated constructor stub
}



public QandA(int qaNo, String replyContent, Timestamp replyCreateDate, Timestamp replyModifyDate, String replyStatus,
		String memberId, int parentBoardNo, int parentReplyNo, int replyDepth, int itemNo, String itemContent,
		String itemNm, int itemPrice, int transCharge, String itemDeleteFl, String itemCategory) {
	super();
	this.qaNo = qaNo;
	this.replyContent = replyContent;
	this.replyCreateDate = replyCreateDate;
	this.replyModifyDate = replyModifyDate;
	this.replyStatus = replyStatus;
	this.memberId = memberId;
	this.parentBoardNo = parentBoardNo;
	this.parentReplyNo = parentReplyNo;
	this.replyDepth = replyDepth;
	this.itemNo = itemNo;
	this.itemContent = itemContent;
	this.itemNm = itemNm;
	this.itemPrice = itemPrice;
	this.transCharge = transCharge;
	this.itemDeleteFl = itemDeleteFl;
	this.itemCategory = itemCategory;
}



public int getQaNo() {
	return qaNo;
}



public void setQaNo(int qaNo) {
	this.qaNo = qaNo;
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



public int getItemNo() {
	return itemNo;
}



public void setItemNo(int itemNo) {
	this.itemNo = itemNo;
}



public String getItemContent() {
	return itemContent;
}



public void setItemContent(String itemContent) {
	this.itemContent = itemContent;
}



public String getItemNm() {
	return itemNm;
}



public void setItemNm(String itemNm) {
	this.itemNm = itemNm;
}



public int getItemPrice() {
	return itemPrice;
}



public void setItemPrice(int itemPrice) {
	this.itemPrice = itemPrice;
}



public int getTransCharge() {
	return transCharge;
}



public void setTransCharge(int transCharge) {
	this.transCharge = transCharge;
}



public String getItemDeleteFl() {
	return itemDeleteFl;
}



public void setItemDeleteFl(String itemDeleteFl) {
	this.itemDeleteFl = itemDeleteFl;
}



public String getItemCategory() {
	return itemCategory;
}



public void setItemCategory(String itemCategory) {
	this.itemCategory = itemCategory;
}



@Override
public String toString() {
	return "QandA [qaNo=" + qaNo + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
			+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + ", memberId=" + memberId
			+ ", parentBoardNo=" + parentBoardNo + ", parentReplyNo=" + parentReplyNo + ", replyDepth=" + replyDepth
			+ ", itemNo=" + itemNo + ", itemContent=" + itemContent + ", itemNm=" + itemNm + ", itemPrice=" + itemPrice
			+ ", transCharge=" + transCharge + ", itemDeleteFl=" + itemDeleteFl + ", itemCategory=" + itemCategory
			+ "]";
}






	
	
}
