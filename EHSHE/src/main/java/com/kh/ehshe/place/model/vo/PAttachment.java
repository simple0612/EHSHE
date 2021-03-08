package com.kh.ehshe.place.model.vo;

public class PAttachment {

	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int placeNo;
	
	public PAttachment() {
	}

	
	
	public PAttachment(String filePath, String fileName, int fileLevel, int placeNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.placeNo = placeNo;
	}



	public PAttachment(int fileNo, String filePath, String fileName, int fileLevel, int placeNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.placeNo = placeNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	@Override
	public String toString() {
		return "PAttachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", placeNo=" + placeNo + "]";
	}

	
	
	
	
	
}
