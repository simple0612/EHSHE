package com.kh.ehshe.home.model.vo;

public class PlaceInfo {
	private int placeNo; // 장소번호
	private String placeTitle; // 장조 제목
	private String placeAtPath; // 이미지저장경로
	private String placeAtName; // 이미지저장이름
	
	
	public PlaceInfo() {}
	
	
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
	public String getPlaceAtPath() {
		return placeAtPath;
	}
	public void setPlaceAtPath(String placeAtPath) {
		this.placeAtPath = placeAtPath;
	}
	public String getPlaceAtName() {
		return placeAtName;
	}
	public void setPlaceAtName(String placeAtName) {
		this.placeAtName = placeAtName;
	}


	@Override
	public String toString() {
		return "PlaceInfo [placeNo=" + placeNo + ", placeTitle=" + placeTitle + ", placeAtPath=" + placeAtPath
				+ ", placeAtName=" + placeAtName + "]";
	}
	
	
}
