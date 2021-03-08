package com.kh.ehshe.place.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class PReview {
	
	private int reviewNo;
	private String reviewContent; 
	private Date reviewCreateDate; 
	private Date reviewModifyDate; 
	private String reviewDeleteFl; 
	private int reviewRating; 
	private int memberNo; 
	private int placeNo; 
	
	public PReview() {
		// TODO Auto-generated constructor stub
	}

	public PReview(int reviewNo, String reviewContent, Date reviewCreateDate, Date reviewModifyDate,
			String reviewDeleteFl, int reviewRating, int memberNo, int placeNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewModifyDate = reviewModifyDate;
		this.reviewDeleteFl = reviewDeleteFl;
		this.reviewRating = reviewRating;
		this.memberNo = memberNo;
		this.placeNo = placeNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	public Date getReviewModifyDate() {
		return reviewModifyDate;
	}

	public void setReviewModifyDate(Date reviewModifyDate) {
		this.reviewModifyDate = reviewModifyDate;
	}

	public String getReviewDeleteFl() {
		return reviewDeleteFl;
	}

	public void setReviewDeleteFl(String reviewDeleteFl) {
		this.reviewDeleteFl = reviewDeleteFl;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	@Override
	public String toString() {
		return "PReview [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewCreateDate="
				+ reviewCreateDate + ", reviewModifyDate=" + reviewModifyDate + ", reviewDeleteFl=" + reviewDeleteFl
				+ ", reviewRating=" + reviewRating + ", memberNo=" + memberNo + ", placeNo=" + placeNo + "]";
	}
	
	
}
