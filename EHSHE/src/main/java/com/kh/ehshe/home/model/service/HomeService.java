package com.kh.ehshe.home.model.service;

import java.util.List;

import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.TopItem;

public interface HomeService {

	
	
	/** 아이템 베스트 3 조회
	 * @param tList 
	 * @return list
	 */
	public abstract List<Item> selectItemList(List<TopItem> tList);

	
	
	/** 아이템 평점 베스트 3조회 
	 * @return
	 */
	public abstract List<TopItem> selectTopList();

}
