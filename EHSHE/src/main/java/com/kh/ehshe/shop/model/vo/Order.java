package com.kh.ehshe.shop.model.vo;

import java.sql.Date;

public class Order {
	private int orderNo; //주문번호 
	private String orderConfirm; //주문 확인
	private int orderPrice; //주문 가격 //
	private String orderContent; // 주문내용
	private Date orderDate; // 주문일 //
	private int memberNo; // 주문한 회원번호
	private String orderAddr; // 주문주소//
	private String orderTel; // 주문 전화번호//
	private String orderRecipient; //수령자 이름//
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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

	public String getOrderContent() {
		return orderContent;
	}

	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderConfirm=" + orderConfirm + ", orderPrice=" + orderPrice
				+ ", orderContent=" + orderContent + ", orderDate=" + orderDate + ", memberNo=" + memberNo
				+ ", orderAddr=" + orderAddr + ", orderTel=" + orderTel + ", orderRecipient=" + orderRecipient + "]";
	}
	
}
