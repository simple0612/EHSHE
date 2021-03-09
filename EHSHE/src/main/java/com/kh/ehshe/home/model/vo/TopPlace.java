package com.kh.ehshe.home.model.vo;

public class TopPlace {
	
	private int rowNum;
	private double score;
	private int placeNo;
	
	public TopPlace() {}

	

	public int getRowNum() {
		return rowNum;
	}



	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}



	public int getPlaceNo() {
		return placeNo;
	}



	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}



	public double getScore() {
		return score;
	}



	public void setScore(double score) {
		this.score = score;
	}



	@Override
	public String toString() {
		return "TopPlace [rowNum=" + rowNum + ", placeNo=" + placeNo + ", score=" + score + "]";
	}


	
	 
}
