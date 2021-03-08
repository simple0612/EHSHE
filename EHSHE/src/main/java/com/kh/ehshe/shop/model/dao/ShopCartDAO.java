package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.Cart;
import com.kh.ehshe.shop.model.vo.Pitem;
import com.kh.ehshe.shop.model.vo.ShopCart;


@Repository
public class ShopCartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	
	/** 장바구니 리스트 조회
	 * @param memberNo
	 * @return list
	 */
	public List<ShopCart> selectCartList(int memberNo) {
		
		return sqlSession.selectList("cartMapper.selectCartList", memberNo);
	}





	/** 장바구니 리스트 삭제
	 * @param map
	 * @return result
	 */
	public int deleteCartItem(Map<String, Object> map) {
		
		return sqlSession.delete("cartMapper.deleteCartItem", map);
	}





	/** 장바구니 전체 목록 삭제
	 * @param map
	 * @return result
	 */
	public int deleteAllCartItem(Map<String, Object> map) {
		
		return sqlSession.delete("cartMapper.deleteAllCartItem", map);
	}





	/** 주문결제 상세 페이지
	 * @param map
	 * @return list
	 */
	public List<ShopCart> ordersheet(Map<String, Object> map) {
		
		return sqlSession.selectList("cartMapper.ordersheet", map);
	}





	/** 주문 결제 내역 삽입.
	 * @param map
	 * @return result
	 */
	public int insertPayment(Map<String, Object> map) {
		
		return sqlSession.insert("cartMapper.insertPayment", map);
	}





	/** 주문 결제 내역 상세 삽입.
	 * @param map
	 * @return result
	 */
	public int insertOrderSpecify(Map<String, Object> map) {
		
		return sqlSession.insert("cartMapper.insertOrderSpecify", map);
	}





	/** 결제한 상품  카트에서 삭제.
	 * @param map
	 * @return result;
	 */
	public int deletOrderItemFromCart(Map<String, Object> map) {
		
		return sqlSession.delete("cartMapper.deletOrderItemFromCart", map);
	}





	/** 장바구니에 담기
	 * @param insertItem
	 * @return result
	 */
	public int insertCart(Cart insertItem) {
		
		return sqlSession.insert("cartMapper.insertCart", insertItem);
	}





	/** 상세페이지에서 결제 버튼 누르면 결제페이지로 이동.
	 * @param map
	 * @return list
	 */
	public List<Pitem> itemPayment(Map<String, Object> map) {
		
		return sqlSession.selectList("cartMapper.itemPayment", map);
	}
}
