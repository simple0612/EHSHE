package com.kh.ehshe.board.model.vo;

public class Attachment {

	private int fileNo;
	private String thumbnailFilePath;
	private String contentFilePath;
	private String fileName;
	private int fileLevel;
	private int boardNo;
	
	public Attachment() {
	}
	

	public Attachment(String thumbnailFilePath, String fileName, int fileLevel, int boardNo) {
		super();
		this.thumbnailFilePath = thumbnailFilePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.boardNo = boardNo;
	}
	

	public Attachment(String thumbnailFilePath, String contentFilePath, String fileName, int fileLevel, int boardNo) {
		super();
		this.thumbnailFilePath = thumbnailFilePath;
		this.contentFilePath = contentFilePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.boardNo = boardNo;
	}


	public Attachment(int fileNo, String thumbnailFilePath, String contentFilePath, String fileName, int fileLevel,
			int boardNo) {
		super();
		this.fileNo = fileNo;
		this.thumbnailFilePath = thumbnailFilePath;
		this.contentFilePath = contentFilePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.boardNo = boardNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getThumbnailFilePath() {
		return thumbnailFilePath;
	}

	public void setThumbnailFilePath(String thumbnailFilePath) {
		this.thumbnailFilePath = thumbnailFilePath;
	}

	public String getContentFilePath() {
		return contentFilePath;
	}

	public void setContentFilePath(String contentFilePath) {
		this.contentFilePath = contentFilePath;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", thumbnailFilePath=" + thumbnailFilePath + ", contentFilePath="
				+ contentFilePath + ", fileName=" + fileName + ", fileLevel=" + fileLevel + ", boardNo=" + boardNo
				+ "]";
	}
	
	
	
}
