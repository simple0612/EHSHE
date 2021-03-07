package com.kh.ehshe.shop.model.vo;

public class SearchShop {

	private String sk;
	private String sv;
	private int shopType;
	
	public SearchShop() {
	}

	public String getSk() {
		return sk;
	}

	public void setSk(String sk) {
		this.sk = sk;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	public int getShopType() {
		return shopType;
	}

	public void setShopType(int shopType) {
		this.shopType = shopType;
	}

	@Override
	public String toString() {
		return "SearchShop [sk=" + sk + ", sv=" + sv + ", shopType=" + shopType + "]";
	}
	
	
}
