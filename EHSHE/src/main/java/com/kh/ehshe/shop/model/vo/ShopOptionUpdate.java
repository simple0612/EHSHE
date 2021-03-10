package com.kh.ehshe.shop.model.vo;

public class ShopOptionUpdate {

	private int optionSpecify_NO;
	private String optionSpecifyContent;
	
	
	public ShopOptionUpdate() {
	}


	
	public ShopOptionUpdate(int optionSpecify_NO, String optionSpecifyContent) {
		super();
		this.optionSpecify_NO = optionSpecify_NO;
		this.optionSpecifyContent = optionSpecifyContent;
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
		return "ShopOptionUpdate [optionSpecify_NO=" + optionSpecify_NO + ", optionSpecifyContent="
				+ optionSpecifyContent + "]";
	}


	



}
