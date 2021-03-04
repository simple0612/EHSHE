package com.kh.ehshe.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopOption;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;
import com.kh.ehshe.shop.model.vo.ShopScore;

@Repository
public class ShopDAO {

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
	
	public List<ShopAttachment> selecShopThumbnailList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopThumnailList",sList);
	}

	/** shop 상세조회 DAO
	 * @param temp
	 * @return shop
	 */
	public Shop selectShopBoard(Shop temp) {
		return sqlSession.selectOne("shopMapper.selectShopBoard",temp);
	}

	
	/** shop에 포함된 이미지 목록 조회 DAO
	 * @param itemNo
	 * @return ShopAttachmnentList
	 */
	public ShopAttachment selectShopAttachmentList(int itemNo) {
		return sqlSession.selectOne("shopMapper.selectShopAttachmentList",itemNo);
	}
	
	/** shop에 포함된 옵션 목록 조회 DAO
	 * @param itemNo
	 * @return
	 */
	public List<ShopOption> selectShopOptionList(int itemNo) {
		return sqlSession.selectList("shopMapper.selectShopOptionList",itemNo);
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
		return sqlSession.insert("shopMapper.insertShopAttachmentList",uploadImages);
	}

	/** Shop 옵션 번호 추가
	 * @param shopNo
	 * @return result
	 */
	public int insertOption(int shopNo) {
		return sqlSession.insert("shopMapper.insertOption",shopNo);
	}

	/** Shop 옵션 다음 번호 알아오기
	 * @param shopNo 
	 * @return result
	 */
	public int selectOptionNextNO(int shopNo) {
		return sqlSession.selectOne("shopMapper.selectOptionNo",shopNo);
	}

	/** Shop 옵션 상세내용 추가
	 * @param shopOption
	 * @return insertOptionDetail
	 */
	public int insertOptionDeatail(List<ShopOption> shopOption) {
		return sqlSession.insert("shopMapper.insertOptionDetail",shopOption);
	}

	/** Shop 게시글 수정 DAO
	 * @param updateShopBoard
	 * @return result
	 */
	public int updateShopBoard(Shop updateShopBoard) {
		return sqlSession.update("shopMapper.updateShopBoard",updateShopBoard);
	}

	/** 파일 정보 수정 DAO
	 * @param uploadImage
	 * @return result
	 */
	public int updateShopAttachment(ShopAttachment at) {
		return sqlSession.update("shopMapper.updateShopAttachment",at);
	}

	/** 섬머노트 이미지 정보 조회
	 * @param itemNo
	 * @return oldFiles
	 */
	public List<ShopAttachment> selectShopSummernoteImg(int itemNo) {
		return sqlSession.selectList("shopMapper.selectShopSummernoteImg",itemNo);
	}

	/** 섬머노트 파일 정보 일관 삭제 DAO
	 * @param deleteFileNoList
	 * @return result
	 */
	public int deleteShopAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("shopMapper.deleteShopAttachmentList",deleteFileNoList);
	}

	public List<Shop> selectShopMainList() {
		return sqlSession.selectList("shopMapper.selectShopMainList");
	}

	public List<ShopAttachment> selectMainAttachmentlList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopMainThList",sList);
	}

	public List<ShopScore> selectStarRatingList(List<Shop> sList) {
		return sqlSession.selectList("shopMapper.selectShopScore" ,sList);
	}



	


}
