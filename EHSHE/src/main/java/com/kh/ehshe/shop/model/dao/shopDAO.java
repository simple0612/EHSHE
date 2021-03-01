package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;

@Repository
public class shopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 특정 게시판 전체 게시글 수 조회 DAO
	 * @param type
	 * @return lisctCount
	 */
	public int getListCount(int type) {
		return sqlSession.selectOne("shopMapper.getListCount",type);
	}

	/** shop 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return sList
	 */
	public List<Shop> selectShopList(ShopPageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage()-1)* pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());

		return sqlSession.selectList("shopMapper.selectShopList",pInfo.getShopType(),rowBounds);
	}

	/** shop 상세조회 DAO
	 * @param temp
	 * @return shop
	 */
	public Shop selectShopBoard(Shop temp) {
		return sqlSession.selectOne("shopMapper.selectShopBoard",temp);
	}

	/** shop 다음 게시글 번호 얻어오기 DAO
	 * @return shopNo
	 */
	public int selectShopNextNo() {
		return sqlSession.selectOne("shopMapper.selectShopNextNo");
	}

	/** shop 게시글 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertShopBoard(Map<String, Object> map) {
		
		return sqlSession.insert("shopMapper.insertShopBoard",map);
	}

	/** 게시글 이미지 삽입 DAO
	 * @param uploadImages
	 * @return result
	 */
	public int insertShopAttachmentList(List<ShopAttachment> uploadImages) {
		return sqlSession.insert("shopMapper.insertShopAttachment",uploadImages);
	}

}
