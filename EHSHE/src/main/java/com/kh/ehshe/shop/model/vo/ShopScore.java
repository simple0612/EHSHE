package com.kh.ehshe.shop.model.vo;

public class ShopScore {
	
	private double score;
	private int itemNo;

	
public ShopScore() {
}



public double getScore() {
	return score;
}



public void setScore(double score) {
	this.score = score;
}



public int getItemNo() {
	return itemNo;
}



public void setItemNo(int itemNo) {
	this.itemNo = itemNo;
}



@Override
public String toString() {
	return "ShopScore [score=" + score + ", itemNo=" + itemNo + "]";
}




}
