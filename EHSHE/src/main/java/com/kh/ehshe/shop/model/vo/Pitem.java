package com.kh.ehshe.shop.model.vo;

public class Pitem {
	private String optionSpecifyContent; //아이템 상세 내용 (빨강)
	private String itemNm; //아이템 이름
	private int itemNo; // 아이템번호
	private int itemPrice; //아이템 가격
	private String imgName; // 이미지 이름
	private String imgPath; // 이미지 경로
	
	public Pitem() {
		// TODO Auto-generated constructor stub
	}

	public String getOptionSpecifyContent() {
		return optionSpecifyContent;
	}

	public void setOptionSpecifyContent(String optionSpecifyContent) {
		this.optionSpecifyContent = optionSpecifyContent;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Pitem [optionSpecifyContent=" + optionSpecifyContent + ", itemNm=" + itemNm + ", itemNo=" + itemNo
				+ ", itemPrice=" + itemPrice + ", imgName=" + imgName + ", imgPath=" + imgPath + "]";
	}
	
	
}
