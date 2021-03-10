package com.kh.ehshe.board.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class VBoard {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String memberId;
	private String memberNm;
	private int memberNo;
	private Timestamp boardCreateDate;
	private int readCount;
	private String boardDeleteFl;
	private String categoryName;
	private String latitude;
	private String longitude;
	private String location;
	private int likeCount;
	
	public VBoard() {
		// TODO Auto-generated constructor stub
	}

	public VBoard(int boardNo, String boardTitle, String boardContent, String memberId, String memberNm, int memberNo,
			Timestamp boardCreateDate, int readCount, String boardDeleteFl, String categoryName, String latitude,
			String longitude, String location, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberId = memberId;
		this.memberNm = memberNm;
		this.memberNo = memberNo;
		this.boardCreateDate = boardCreateDate;
		this.readCount = readCount;
		this.boardDeleteFl = boardDeleteFl;
		this.categoryName = categoryName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.location = location;
		this.likeCount = likeCount;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberNm() {
		return memberNm;
	}

	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Timestamp boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getBoardDeleteFl() {
		return boardDeleteFl;
	}

	public void setBoardDeleteFl(String boardDeleteFl) {
		this.boardDeleteFl = boardDeleteFl;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "VBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memberId=" + memberId + ", memberNm=" + memberNm + ", memberNo=" + memberNo + ", boardCreateDate="
				+ boardCreateDate + ", readCount=" + readCount + ", boardDeleteFl=" + boardDeleteFl + ", categoryName="
				+ categoryName + ", latitude=" + latitude + ", longitude=" + longitude + ", location=" + location
				+ ", likeCount=" + likeCount + "]";
	}

	
	
}
