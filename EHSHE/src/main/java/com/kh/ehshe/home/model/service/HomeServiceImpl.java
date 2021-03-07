package com.kh.ehshe.home.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ehshe.home.model.dao.HomeDAO;
import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.TopItem;

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
}
