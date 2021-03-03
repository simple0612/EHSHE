package com.kh.ehshe.shop.model.vo;

public class ShopCart {
	
	private int memberNo; //회원번호
	private int optionSpecifyNo; //옵션 상세번호
	private int buyingQuantity; // 구매량
	private int itemNo; // 아이템번호
	private int itemPrice; //아이템 가격
	private String itemNm; //아이템 이름
	private String imgName; // 이미지 이름
	private String imgPath; // 이미지 경로
	private int imgLevel; //이미지 레벨
	private String itemOptionContent; //아이템 옵션내용 (색상)
	private String optionSpecifyContent; //아이템 상세 내용 (빨강)

	public ShopCart() {}

	public ShopCart(int memberNo, int optionSpecifyNo, int buyingQuantity, int itemNo, int itemPrice, String itemNm,
			String imgName, String imgPath, int imgLevel, String itemOptionContent, String optionSpecifyContent) {
		super();
		this.memberNo = memberNo;
		this.optionSpecifyNo = optionSpecifyNo;
		this.buyingQuantity = buyingQuantity;
		this.itemNo = itemNo;
		this.itemPrice = itemPrice;
		this.itemNm = itemNm;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.imgLevel = imgLevel;
		this.itemOptionContent = itemOptionContent;
		this.optionSpecifyContent = optionSpecifyContent;
	}

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

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
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

	public String getItemOptionContent() {
		return itemOptionContent;
	}

	public void setItemOptionContent(String itemOptionContent) {
		this.itemOptionContent = itemOptionContent;
	}

	public String getOptionSpecifyContent() {
		return optionSpecifyContent;
	}

	public void setOptionSpecifyContent(String optionSpecifyContent) {
		this.optionSpecifyContent = optionSpecifyContent;
	}

	@Override
	public String toString() {
		return "ShopCart [memberNo=" + memberNo + ", optionSpecifyNo=" + optionSpecifyNo + ", buyingQuantity="
				+ buyingQuantity + ", itemNo=" + itemNo + ", itemPrice=" + itemPrice + ", itemNm=" + itemNm
				+ ", imgName=" + imgName + ", imgPath=" + imgPath + ", imgLevel=" + imgLevel + ", itemOptionContent="
				+ itemOptionContent + ", optionSpecifyContent=" + optionSpecifyContent + "]";
	}

}
