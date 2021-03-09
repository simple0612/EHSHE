package com.kh.ehshe.home.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ehshe.home.model.dao.HomeDAO;
import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.PlaceInfo;
import com.kh.ehshe.home.model.vo.TopItem;
import com.kh.ehshe.home.model.vo.TopPlace;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeDAO dao;

	
	
	
	
	// 아이템 베스트 3 조회
	@Override
	public List<Item> selectItemList(List<TopItem> tList) {
		
		return dao.selectItemList(tList);
	}




	// 아이템 평점 탑 3 조회
	@Override
	public List<TopItem> selectTopList() {

		return dao.selectTopList();
	}



	// 장소 평점 탑 3조회
	@Override
	public List<TopPlace> selectTopPlaceList() {
		
		return dao.selectTopPlaceList();
	}



	// 장소 베스트 3조회
	@Override
	public List<PlaceInfo> selectPlaceInfoList(List<TopPlace> tpList) {
		
		return dao.selectPlaceInfoList(tpList);
	}
}
