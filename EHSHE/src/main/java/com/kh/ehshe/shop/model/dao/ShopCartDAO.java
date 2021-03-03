package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}