package com.kh.ehshe.shop.model.vo;

public class ShopOption {

	private int optionNo;
	private String ItemOptionContent;
	private int parentNo;
	private int itemNo;

	private int optionSpecify_NO;
	private String optionSpecifyContent;
	
	
	public ShopOption() {
	}


	/*
	 * public ShopOption(int optionSpecify_NO, String optionSpecifyContent) {
	 * super(); this.optionSpecify_NO = optionSpecify_NO; this.optionSpecifyContent
	 * = optionSpecifyContent; }
	 * 
	 */
	public ShopOption(int optionNo, String optionSpecifyContent) {
		super();
		this.optionNo = optionNo;
		this.optionSpecifyContent = optionSpecifyContent;
	}




	/*
	 * public ShopOption(String itemOptionContent, int optionSpecify_NO) { super();
	 * ItemOptionContent = itemOptionContent; this.optionSpecify_NO =
	 * optionSpecify_NO; }
	 */



	public int getOptionNo() {
		return optionNo;
	}


	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}


	public String getItemOptionContent() {
		return ItemOptionContent;
	}


	public void setItemOptionContent(String itemOptionContent) {
		ItemOptionContent = itemOptionContent;
	}


	public int getParentNo() {
		return parentNo;
	}


	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}


	public int getOptionSpecify_NO() {
		return optionSpecify_NO;
	}


	public void setOptionSpecify_NO(int optionSpecify_NO) {
		this.optionSpecify_NO = optionSpecify_NO;
	}


	public String getOptionSpecifyContent() {
		return optionSpecifyContent;
	}


	public void setOptionSpecifyContent(String optionSpecifyContent) {
		this.optionSpecifyContent = optionSpecifyContent;
	}

	@Override
	public String toString() {
		return "ShopOption [optionNo=" + optionNo + ", ItemOptionContent=" + ItemOptionContent + ", parentNo="
				+ parentNo + ", itemNo=" + itemNo + ", optionSpecify_NO=" + optionSpecify_NO + ", optionSpecifyContent="
				+ optionSpecifyContent + "]";
	}

	


	
	
	
	
	
}
