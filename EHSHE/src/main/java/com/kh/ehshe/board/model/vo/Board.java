package com.kh.ehshe.board.model.vo;

import java.sql.Timestamp;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String memberNo;
	private int readCount;
	private String categoryName;
	private Timestamp boardCreateDate;
	private String boardDeleteFl;
	private String latitude;
	private String longitude;
	private String location;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String boardTitle, String boardContent, String memberNo, int readCount,
			String categoryName, Timestamp boardCreateDate, String boardDeleteFl, String latitude, String longitude,
			String location) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberNo = memberNo;
		this.readCount = readCount;
		this.categoryName = categoryName;
		this.boardCreateDate = boardCreateDate;
		this.boardDeleteFl = boardDeleteFl;
		this.latitude = latitude;
		this.longitude = longitude;
		this.location = location;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Timestamp getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Timestamp boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public String getBoardDeleteFl() {
		return boardDeleteFl;
	}

	public void setBoardDeleteFl(String boardDeleteFl) {
		this.boardDeleteFl = boardDeleteFl;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memberNo=" + memberNo + ", readCount=" + readCount + ", categoryName=" + categoryName
				+ ", boardCreateDate=" + boardCreateDate + ", boardDeleteFl=" + boardDeleteFl + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", location=" + location + "]";
	}
	
	
}
