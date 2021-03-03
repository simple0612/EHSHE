package com.kh.ehshe.shop.model.vo;

public class ShopAttachment {

	private int fileNo;
	private String fileName;
	private String filePath;
	private int fileLevel;
	private int parentShopNo;
	
	public ShopAttachment() {
	}

	public ShopAttachment(String fileName, String filePath, int fileLevel, int parentShopNo) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.parentShopNo = parentShopNo;
	}
	

	public ShopAttachment(int fileNo, String fileName, String filePath, int fileLevel, int parentShopNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.parentShopNo = parentShopNo;
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

	public int getParentShopNo() {
		return parentShopNo;
	}

	public void setParentShopNo(int parentShopNo) {
		this.parentShopNo = parentShopNo;
	}

	@Override
	public String toString() {
		return "ShopAttachment [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileLevel="
				+ fileLevel + ", parentShopNo=" + parentShopNo + "]";
	}



	
	
	
	
}
