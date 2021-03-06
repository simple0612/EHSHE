package com.kh.ehshe.home.model.service;

import java.util.List;

import com.kh.ehshe.home.model.vo.Item;

public interface HomeService {

	
	
	/** 아이템 베스트 3 조회
	 * @return list
	 */
	public abstract List<Item> selectItemList();

}
