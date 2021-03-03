package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ehshe.shop.model.dao.ShopCartDAO;
import com.kh.ehshe.shop.model.vo.ShopCart;

@Service
public class ShopCartServiceImpl implements ShopCartService {
	
	
	@Autowired
	private ShopCartDAO dao;
	
	
	
	
	// 장바구니 목록 조회
	@Override
	public List<ShopCart> selectCartList(int memberNo) {
		
		return dao.selectCartList(memberNo);
	}
	
	
	// 장바구니 목록 선택 삭제.
	@Override
	public int deleteCartItem(Map<String, Object> map) {
		
		return dao.deleteCartItem(map);
	}


	
	
	// 장바구니 목록 전체 삭제
	@Override
	public int deleteAllCartItem(Map<String, Object> map) {

		return dao.deleteAllCartItem(map);
	}

	
	
	// 주문결제 상세 페이지
	@Override
	public List<ShopCart> ordersheet(Map<String, Object> map) {
		
		return dao.ordersheet(map);
	}
	
}