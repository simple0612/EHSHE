package com.kh.ehshe.shop.model.vo;

import java.sql.Date;

public class ItemReview {

	private int orderNo; // 주문번호
	private String orderContent; // 주문 내용
	private String itemContent; // ITEM_CONTENT
	private Date orderDate; // 주문내용
	private String orderConfirm; // 주문 확인
	private int orderPrice; // 주문 가격 //
	private int memberNo; // 주문한 회원번호
	private String orderAddr; // 주문주소//
	private String orderTel; // 주문 전화번호//
	private String orderRecipient; // 수령자 이름//
	private int itemCategory;
	private String itemNm;
	private String itemNo;
	
	
	public ItemReview() {
		// TODO Auto-generated constructor stub
	}


	public ItemReview(int orderNo, String orderContent, String itemContent, Date orderDate, String orderConfirm,
			int orderPrice, int memberNo, String orderAddr, String orderTel, String orderRecipient, int itemCategory,
			String itemNm, String itemNo) {
		super();
		this.orderNo = orderNo;
		this.orderContent = orderContent;
		this.itemContent = itemContent;
		this.orderDate = orderDate;
		this.orderConfirm = orderConfirm;
		this.orderPrice = orderPrice;
		this.memberNo = memberNo;
		this.orderAddr = orderAddr;
		this.orderTel = orderTel;
		this.orderRecipient = orderRecipient;
		this.itemCategory = itemCategory;
		this.itemNm = itemNm;
		this.itemNo = itemNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getOrderContent() {
		return orderContent;
	}


	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}


	public String getItemContent() {
		return itemContent;
	}


	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderConfirm() {
		return orderConfirm;
	}


	public void setOrderConfirm(String orderConfirm) {
		this.orderConfirm = orderConfirm;
	}


	public int getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getOrderAddr() {
		return orderAddr;
	}


	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}


	public String getOrderTel() {
		return orderTel;
	}


	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}


	public String getOrderRecipient() {
		return orderRecipient;
	}


	public void setOrderRecipient(String orderRecipient) {
		this.orderRecipient = orderRecipient;
	}


	public int getItemCategory() {
		return itemCategory;
	}


	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}


	public String getItemNm() {
		return itemNm;
	}


	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}


	public String getItemNo() {
		return itemNo;
	}


	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}


	@Override
	public String toString() {
		return "ItemReview [orderNo=" + orderNo + ", orderContent=" + orderContent + ", itemContent=" + itemContent
				+ ", orderDate=" + orderDate + ", orderConfirm=" + orderConfirm + ", orderPrice=" + orderPrice
				+ ", memberNo=" + memberNo + ", orderAddr=" + orderAddr + ", orderTel=" + orderTel + ", orderRecipient="
				+ orderRecipient + ", itemCategory=" + itemCategory + ", itemNm=" + itemNm + ", itemNo=" + itemNo + "]";
	}
	
	
	
	
	

}
