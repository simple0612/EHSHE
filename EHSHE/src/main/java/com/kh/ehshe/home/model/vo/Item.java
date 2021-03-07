package com.kh.ehshe.home.model.vo;

public class Item {
	
	private int itemNo; //아이템 번호
	private String itemNm; // 상품 이름
	private int itemPrice; // 상품 가격
	private String imgName; // 상품 이미지 이름
	private String imgPath; // 상품 이미지 경로
	private int imgLevel; // 상품 이미지 레벨
	private int itemCategory; // 상품 카테고리
	
	public Item() {
		// TODO Auto-generated constructor stub
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	public int getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}

	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemNm=" + itemNm + ", itemPrice=" + itemPrice + ", imgName=" + imgName
				+ ", imgPath=" + imgPath + ", imgLevel=" + imgLevel + ", itemCategory=" + itemCategory + "]";
	}


	
	
}
