package com.kh.ehshe.shop.model.vo;

public class Cart {
	
	private int memberNo; //회원번호
	private int optionSpecifyNo; //옵션 상세번호
	private int buyingQuantity; // 구매량
	private int itemNo; // 아이템번호
	
	public Cart() {}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getOptionSpecifyNo() {
		return optionSpecifyNo;
	}

	public void setOptionSpecifyNo(int optionSpecifyNo) {
		this.optionSpecifyNo = optionSpecifyNo;
	}

	public int getBuyingQuantity() {
		return buyingQuantity;
	}

	public void setBuyingQuantity(int buyingQuantity) {
		this.buyingQuantity = buyingQuantity;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	@Override
	public String toString() {
		return "Cart [memberNo=" + memberNo + ", optionSpecifyNo=" + optionSpecifyNo + ", buyingQuantity="
				+ buyingQuantity + ", itemNo=" + itemNo + "]";
	}
	
	
}
