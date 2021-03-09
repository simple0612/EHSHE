package com.kh.ehshe.home.model.service;

import java.util.List;

import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.PlaceInfo;
import com.kh.ehshe.home.model.vo.TopItem;
import com.kh.ehshe.home.model.vo.TopPlace;

public interface HomeService {

	
	
	/** 아이템 베스트 3 조회
	 * @param tList 
	 * @return list
	 */
	public abstract List<Item> selectItemList(List<TopItem> tList);

	
	
	/** 아이템 평점 베스트 3조회 
	 * @return List
	 */
	public abstract List<TopItem> selectTopList();

	
	
	/** 장소 평점 베스트 3조회
	 * @return List
	 */
	public abstract List<TopPlace> selectTopPlaceList();


	
	
	/** 아이템 베스트 3조회
	 * @param tpList 
	 * @return list
	 */
	public abstract List<PlaceInfo> selectPlaceInfoList(List<TopPlace> tpList);

}
