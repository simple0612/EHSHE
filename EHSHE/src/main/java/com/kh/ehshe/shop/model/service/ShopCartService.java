package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.shop.model.vo.ShopCart;


public interface ShopCartService {

	
	
	/** 장바구니 조회
	 * @param memberNo
	 * @return list
	 */
	public abstract List<ShopCart> selectCartList(int memberNo);
	
	
	
	
	/** 카트에 추가된 아이템 목록 삭제.
	 * @param map
	 * @return result
	 */
	public abstract int deleteCartItem(Map<String, Object> map);




	/** 카트에 추가된 아이템 목록 전체 삭제
	 * @param map
	 * @return result
	 */
	public abstract int deleteAllCartItem(Map<String, Object> map);




	/** 주문 결제 상세 페이지
	 * @param map
	 * @return list
	 */
	public abstract List<ShopCart> ordersheet(Map<String, Object> map);
	
	

}
