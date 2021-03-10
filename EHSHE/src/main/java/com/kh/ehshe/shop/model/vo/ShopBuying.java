package com.kh.ehshe.shop.model.vo;

public class ShopBuying {
	
	private int orderSpecifyNo;
	private int optionSpecifyNo;
	private String optionSpecifyContent;
	
	public ShopBuying() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderSpecifyNo() {
		return orderSpecifyNo;
	}

	public void setOrderSpecifyNo(int orderSpecifyNo) {
		this.orderSpecifyNo = orderSpecifyNo;
	}

	public int getOptionSpecifyNo() {
		return optionSpecifyNo;
	}

	public void setOptionSpecifyNo(int optionSpecifyNo) {
		this.optionSpecifyNo = optionSpecifyNo;
	}

	public String getOptionSpecifyContent() {
		return optionSpecifyContent;
	}

	public void setOptionSpecifyContent(String optionSpecifyContent) {
		this.optionSpecifyContent = optionSpecifyContent;
	}

	@Override
	public String toString() {
		return "ShopBuying [orderSpecifyNo=" + orderSpecifyNo + ", optionSpecifyNo=" + optionSpecifyNo
				+ ", optionSpecifyContent=" + optionSpecifyContent + "]";
	}
	
	
}
