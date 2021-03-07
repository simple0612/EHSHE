package com.kh.ehshe.shop.model.vo;

import java.sql.Timestamp;

public class Shop {
	
	private int itemNo;
	private String itemContent;
	private String itemNm;
	private int itemPrice;
	private int transCharge;
	private String itemDeleteFl;
	private Timestamp itemCreateDt;
	private int itemCategory;
	private String itemCategoryNm;
	
	private int fileNo;
	private String fileName;
	private String filePath;
	private int fileLevel;
	
	private double score;
	

	public Shop() {}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}


	public String getItemContent() {
		return itemContent;
	}


	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
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


	public int getTransCharge() {
		return transCharge;
	}


	public void setTransCharge(int transCharge) {
		this.transCharge = transCharge;
	}


	public String getItemDeleteFl() {
		return itemDeleteFl;
	}


	public void setItemDeleteFl(String itemDeleteFl) {
		this.itemDeleteFl = itemDeleteFl;
	}


	public Timestamp getItemCreateDt() {
		return itemCreateDt;
	}


	public void setItemCreateDt(Timestamp itemCreateDt) {
		this.itemCreateDt = itemCreateDt;
	}


	public int getItemCategory() {
		return itemCategory;
	}


	public void setItemCategory(int itemCategory) {
		this.itemCategory = itemCategory;
	}


	public String getItemCategoryNm() {
		return itemCategoryNm;
	}


	public void setItemCategoryNm(String itemCategoryNm) {
		this.itemCategoryNm = itemCategoryNm;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public double getScore() {
		return score;
	}


	public void setScore(double score) {
		this.score = score;
	}


	@Override
	public String toString() {
		return "Shop [itemNo=" + itemNo + ", itemContent=" + itemContent + ", itemNm=" + itemNm + ", itemPrice="
				+ itemPrice + ", transCharge=" + transCharge + ", itemDeleteFl=" + itemDeleteFl + ", itemCreateDt="
				+ itemCreateDt + ", itemCategory=" + itemCategory + ", itemCategoryNm=" + itemCategoryNm + ", fileNo="
				+ fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", score="
				+ score + "]";
	}


	
    
		
}
