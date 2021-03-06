package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.shop.model.vo.Cart;
import com.kh.ehshe.shop.model.vo.Pitem;
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




	/** 결제내역 삽입
	 * @param map
	 * @return result
	 */
	public abstract int insertPayment(Map<String, Object> map);




	
	
	/** 장바구니에 담기.
	 * @param insertItem
	 * @return result
	 */
	public abstract int insertCart(Cart insertItem);




	/** 상세페이지에서 결제 버튼 누르면 결제페이지로 이동.
	 * @param map
	 * @return List
	 */
	public abstract List<Pitem> itemPayment(Map<String, Object> map);
	
	

}
