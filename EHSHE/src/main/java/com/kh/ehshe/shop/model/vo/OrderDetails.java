package com.kh.ehshe.shop.model.vo;

public class OrderDetails {
	private int orderSpecifyNo; // 주문 상세 번호
	private int orderNo; // 주문 번호
	private int optionSpecifyNo; // 옵션 상세 번호
	
	
	public OrderDetails() {}


	public int getOrderSpecifyNo() {
		return orderSpecifyNo;
	}


	public void setOrderSpecifyNo(int orderSpecifyNo) {
		this.orderSpecifyNo = orderSpecifyNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getOptionSpecifyNo() {
		return optionSpecifyNo;
	}


	public void setOptionSpecifyNo(int optionSpecifyNo) {
		this.optionSpecifyNo = optionSpecifyNo;
	}
		
	
	@Override
	public String toString() {
		return "OrderDetails [orderSpecifyNo=" + orderSpecifyNo + ", orderNo=" + orderNo + ", optionSpecifyNo="
				+ optionSpecifyNo + "]";
	}
	
	
}
