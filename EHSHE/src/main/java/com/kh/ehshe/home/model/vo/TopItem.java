package com.kh.ehshe.home.model.vo;

public class TopItem {
	
	private int rowNum;
	private int itemNo;
	private double score;
	
	public TopItem() {
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "TopItem [rowNum=" + rowNum + ", itemNo=" + itemNo + ", score=" + score + "]";
	}

	
}
