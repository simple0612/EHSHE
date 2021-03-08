package com.kh.ehshe.place.model.vo;

import java.util.Arrays;

public class SearchPlace {
	
	private String sk;
	private String sv;
	private String[] ct;
	
	public SearchPlace() {
		// TODO Auto-generated constructor stub
	}

	public SearchPlace(String sk, String sv, String[] ct) {
		super();
		this.sk = sk;
		this.sv = sv;
		this.ct = ct;
	}

	public String getSk() {
		return sk;
	}

	public void setSk(String sk) {
		this.sk = sk;
	}

	public String getSv() {
		return sv;
	}

	public void setSv(String sv) {
		this.sv = sv;
	}

	public String[] getCt() {
		return ct;
	}

	public void setCt(String[] ct) {
		this.ct = ct;
	}

	@Override
	public String toString() {
		return "Search [sk=" + sk + ", sv=" + sv + ", ct=" + Arrays.toString(ct) + "]";
	}
	
	
}
