package com.kh.ehshe.shop.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.SearchShop;
import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopOption;
import com.kh.ehshe.shop.model.vo.ShopOptionUpdate;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;
import com.kh.ehshe.shop.model.vo.ShopScore;

@Repository
public class ShopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 특정 게시판 전체 게시글 수 조회 DAO
	 * 
	 * @param type
	 * @return lisctCount
	 */
	public int getListCount(int type) {
		return sqlSession.selectOne("shopMapper.getListCount", type);
	}

	/**
	 * shop 게시글 목록 조회 DAO
	 * 
	 * @param pInfo
	 * @return sList
	 */
	public List<Shop> selectShopList(ShopPageInfo pInfo) {

		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("shopMapper.selectShopList", pInfo.getShopType(), rowBounds);
	}

	public List<ShopAttachment> selecShopThumbnailList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopThumnailList", sList);
	}

	/**
	 * shop 상세조회 DAO
	 * 
	 * @param temp
	 * @return shop
	 */
	public Shop selectShopBoard(Shop temp) {
		return sqlSession.selectOne("shopMapper.selectShopBoard", temp);
	}

	/**
	 * shop에 포함된 이미지 목록 조회 DAO
	 * 
	 * @param itemNo
	 * @return ShopAttachmnentList
	 */
	public ShopAttachment selectShopAttachmentList(int itemNo) {
		return sqlSession.selectOne("shopMapper.selectShopAttachmentList", itemNo);
	}

	/**
	 * shop에 포함된 옵션 목록 조회 DAO
	 * 
	 * @param itemNo
	 * @return
	 */
	public List<ShopOption> selectShopOptionList(int itemNo) {
		return sqlSession.selectList("shopMapper.selectShopOptionList", itemNo);
	}

	/**
	 * shop 다음 게시글 번호 얻어오기 DAO
	 * 
	 * @return shopNo
	 */
	public int selectShopNextNo() {
		return sqlSession.selectOne("shopMapper.selectShopNextNo");
	}

	/**
	 * shop 게시글 삽입 DAO
	 * 
	 * @param map
	 * @return result
	 */
	public int insertShopBoard(Map<String, Object> map) {

		return sqlSession.insert("shopMapper.insertShopBoard", map);
	}

	/**
	 * 게시글 이미지 삽입 DAO
	 * 
	 * @param uploadImages
	 * @return result
	 */
	public int insertShopAttachmentList(List<ShopAttachment> uploadImages) {
		return sqlSession.insert("shopMapper.insertShopAttachmentList", uploadImages);
	}

	/**
	 * Shop 옵션 번호 추가
	 * 
	 * @param shopNo
	 * @return result
	 */
	public int insertOption(int shopNo) {
		return sqlSession.insert("shopMapper.insertOption", shopNo);
	}

	/**
	 * Shop 옵션 다음 번호 알아오기
	 * 
	 * @param shopNo
	 * @return result
	 */
	public int selectOptionNextNO(int shopNo) {
		return sqlSession.selectOne("shopMapper.selectOptionNo", shopNo);
	}

	/**
	 * Shop 옵션 상세내용 추가
	 * 
	 * @param shopOption
	 * @return insertOptionDetail
	 */
	public int insertOptionDeatail(List<ShopOption> shopOption) {
		return sqlSession.insert("shopMapper.insertOptionDetail", shopOption);
	}

	/**
	 * Shop 게시글 수정 DAO
	 * 
	 * @param updateShopBoard
	 * @return result
	 */
	public int updateShopBoard(Shop updateShopBoard) {
		return sqlSession.update("shopMapper.updateShopBoard", updateShopBoard);
	}

	/**
	 * 파일 정보 수정 DAO
	 * 
	 * @param uploadImage
	 * @return result
	 */
	public int updateShopAttachment(ShopAttachment at) {
		return sqlSession.update("shopMapper.updateShopAttachment", at);
	}

	/**
	 * 섬머노트 이미지 정보 조회
	 * 
	 * @param itemNo
	 * @return oldFiles
	 */
	public List<ShopAttachment> selectShopSummernoteImg(int itemNo) {
		return sqlSession.selectList("shopMapper.selectShopSummernoteImg", itemNo);
	}

	/**
	 * 섬머노트 파일 정보 일관 삭제 DAO
	 * 
	 * @param deleteFileNoList
	 * @return result
	 */
	public int deleteShopAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("shopMapper.deleteShopAttachmentList", deleteFileNoList);
	}

	public List<Shop> selectShopMainList() {
		return sqlSession.selectList("shopMapper.selectShopMainList");
	}

	public List<ShopAttachment> selectMainAttachmentlList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopMainThList", sList);
	}

	public List<ShopScore> selectStarRatingList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopScore", sList);
	}

	/** 검색조건에 맞는 게시글 수 조회 DAO
	 * @param search
	 * @return listCount
	 */
	public int getSearchListCount(SearchShop search) {
		return sqlSession.selectOne("shopMapper.getSearchListCount",search);
	}

	/** 검색 조건이 포함된 게시글 목록 조회 DAO
	 * @param search
	 * @param pInfo
	 * @return bList
	 */
	public List<Shop> selectShopSearchList(SearchShop search, ShopPageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		
		return sqlSession.selectList("shopMapper.selectShopSearchList",search,rowBounds);
	}

	public int insertOptionNoDeatail(int shopOptionNo) {
		return sqlSession.insert("shopMapper.insertOtionNoDetail",shopOptionNo);
	}

	/** 메인페이지 인기순위 리스트 조회
	 * @return
	 */
	public List<Shop> selectShopHotList() {
		return sqlSession.selectList("shopMapper.selectMainHotList");
	}

	// 상세페이지 별점 조회
	public ShopScore selectViewStarRation(int itemNo) {
		return sqlSession.selectOne("shopMapper.selectViewStarRation",itemNo);
	}

	// 옵션삭제
	public int deleteOptionList(List<Integer> deleteOptionList) {
		return sqlSession.update("shopMapper.deleteOptionList",deleteOptionList);
	}

	// 옵션 업데이트 
	public int updateShopOption(List<ShopOptionUpdate> ShopOptionUpdate) {
		return sqlSession.update("shopMapper.updateShopOption",ShopOptionUpdate);
	}
 
	// 상품 옵션 번호 구해오기 
	public int selectOption(int itemNo) {
		return sqlSession.selectOne("shopMapper.selectOption",itemNo);
	
	}

	
	// 상품 삭제 
	public int deleteProduct(int itemNo) {
		return sqlSession.update("shopMapper.deleteProduct",itemNo);
	}

	// 옵션 업데이트 중 새로들어온 옵션내용 
	/*
	 * public int updateInsertContent(List<ShopOption> shopOptionInsert ) {
	 * 
	 * return sqlSession.insert("shopMapper.updateOptionInsert",shopOptionInsert); }
	 */
	

	/*	*//**
			 * shop option 업데이트를 위한 번호알아오기
			 * 
			 * @param itemNo
			 * @return optionNo
			 *//*
				 * public int selectOption(int itemNo) { return
				 * sqlSession.selectOne("shopMapper.selectOptionNo",itemNo); }
				 */

}
