package com.kh.ehshe.place.model.vo;

import java.sql.Date;

public class Place {

	private int placeNo;
	private String placeTitle;
	private String placeContent;
	private Date placeCtreateDate;
	private Date placeModifyDate;
	private String location;
	private String categoryName;
	private String phone;
	private int readCount;
	private String placeDeleteFl;
	private double latitude;
	private double longitude;
	private int adminNo;
	private String priceRange;
	private String businessHours;
	private String parking;
	private String holiday;
	private String enroll;
	private String enrollContents;
	
	public Place() {
		// TODO Auto-generated constructor stub
	}

	public Place(int placeNo, String placeTitle, String placeContent, Date placeCtreateDate, Date placeModifyDate,
			String location, String categoryName, String phone, int readCount, String placeDeleteFl, double latitude,
			double longitude, int adminNo, String priceRange, String businessHours, String parking, String holiday,
			String enroll, String enrollContents) {
		super();
		this.placeNo = placeNo;
		this.placeTitle = placeTitle;
		this.placeContent = placeContent;
		this.placeCtreateDate = placeCtreateDate;
		this.placeModifyDate = placeModifyDate;
		this.location = location;
		this.categoryName = categoryName;
		this.phone = phone;
		this.readCount = readCount;
		this.placeDeleteFl = placeDeleteFl;
		this.latitude = latitude;
		this.longitude = longitude;
		this.adminNo = adminNo;
		this.priceRange = priceRange;
		this.businessHours = businessHours;
		this.parking = parking;
		this.holiday = holiday;
		this.enroll = enroll;
		this.enrollContents = enrollContents;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceTitle() {
		return placeTitle;
	}

	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}

	public String getPlaceContent() {
		return placeContent;
	}

	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
	}

	public Date getPlaceCtreateDate() {
		return placeCtreateDate;
	}

	public void setPlaceCtreateDate(Date placeCtreateDate) {
		this.placeCtreateDate = placeCtreateDate;
	}

	public Date getPlaceModifyDate() {
		return placeModifyDate;
	}

	public void setPlaceModifyDate(Date placeModifyDate) {
		this.placeModifyDate = placeModifyDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getPlaceDeleteFl() {
		return placeDeleteFl;
	}

	public void setPlaceDeleteFl(String placeDeleteFl) {
		this.placeDeleteFl = placeDeleteFl;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}

	public String getBusinessHours() {
		return businessHours;
	}

	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getEnroll() {
		return enroll;
	}

	public void setEnroll(String enroll) {
		this.enroll = enroll;
	}

	public String getEnrollContents() {
		return enrollContents;
	}

	public void setEnrollContents(String enrollContents) {
		this.enrollContents = enrollContents;
	}

	@Override
	public String toString() {
		return "Place [placeNo=" + placeNo + ", placeTitle=" + placeTitle + ", placeContent=" + placeContent
				+ ", placeCtreateDate=" + placeCtreateDate + ", placeModifyDate=" + placeModifyDate + ", location="
				+ location + ", categoryName=" + categoryName + ", phone=" + phone + ", readCount=" + readCount
				+ ", placeDeleteFl=" + placeDeleteFl + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", adminNo=" + adminNo + ", priceRange=" + priceRange + ", businessHours=" + businessHours
				+ ", parking=" + parking + ", holiday=" + holiday + ", enroll=" + enroll + ", enrollContents="
				+ enrollContents + "]";
	}

	
	
	
}
