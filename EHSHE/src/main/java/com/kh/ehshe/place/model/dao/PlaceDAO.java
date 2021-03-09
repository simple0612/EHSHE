package com.kh.ehshe.place.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.Place;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
import com.kh.ehshe.place.model.vo.SearchPlace;
import com.kh.ehshe.place.model.vo.VPlace;

@Repository
public class PlaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**	게시판 전체 게시글 수 조회 DAO
	 * 작성자 mang
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("placeMapper.getListCount");
	}
	
	/** 게시글 목록 조회 DAO
	 * 작성자 mang
	 * @param pInfo
	 * @return bList
	 */
	public List<VPlace> selectList(PlacePageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("placeMapper.selectList", null, rowBounds);
	}
	// 인기 음식점
	public List<VPlace> selectrastList(PlacePageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("placeMapper.selectrastList", null, rowBounds);
	}
	// bset 
	public List<VPlace> selectbestList(PlacePageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("placeMapper.selectbestList", null, rowBounds);
	}

	/** 게시글 목록 썸네일 조회 DAO
	 * 작성자 mang
	 * @param bList
	 * @return thumbnailList
	 */
	public List<PAttachment> selectThumbnailList(List<VPlace> pList) {
		return sqlSession.selectList("placeMapper.selectThumbnailList", pList);
	}

	/** 게시글 상세 조회 DAO
	 * 작성자 mang
	 * @param placeNo
	 * @return place
	 */
	public VPlace selectPlace(int placeNo) {
		return sqlSession.selectOne("placeMapper.selectPlace", placeNo);
	}

	/** 게시글 조회수 증가 DAO
	 * 작성자 mang
	 * @param placeNo
	 * @return result
	 */
	public int increaseReadCount(int placeNo) {
		return sqlSession.update("placeMapper.increaseReadCount", placeNo);
	}

	/** 게시글 이미지 목록 조회 DAO
	 * 작성자 mang
	 * @param placeNo
	 * @return Thumbnail
	 */
	public PAttachment selectAttachment(int placeNo) {
		return sqlSession.selectOne("placeMapper.selectAttachment", placeNo);
	}
	
	/** 게시글 이미지 목록 조회 DAO
	 * 작성자 mang
	 * @param placeNo
	 * @return attachmentList
	 */
	public List<PAttachment> selectAttachmentList(int placeNo) {
		return sqlSession.selectList("placeMapper.selectAttachmentList", placeNo);
	}
	
	/** 게시글 다음 번호 조회 DAO
	 * 작성자 mang
	 * @return result
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("placeMapper.selectNextNo");
	}

	/** 게시글 삽입 DAO
	 * 작성자 mang
	 * @param map
	 * @return result
	 */
	public int insertPlace(Map<String, Object> map) {
		return sqlSession.insert("placeMapper.insertPlace", map);
	}

	/** 파일 정보 삽입 DAO
	 * 작성자 mang
	 * @param uploadImages
	 * @return result
	 */
	public int insertAttachmentList(List<PAttachment> uploadImages) {
		return sqlSession.insert("placeMapper.insertAttachmentList", uploadImages);
	}

	/** Place 수정 DAO
	 * @param updatePlace
	 * @return result
	 */
	public int updatePlace(Place updatePlace) {
		return sqlSession.update("placeMapper.updatePlace", updatePlace);
	}

	/** 파일 정보 수정 DAO
	 * 작성자 mang
	 * @param at
	 * @return
	 */
	public int updatePAttachment(PAttachment at) {
		return sqlSession.update("placeMapper.updatePAttachment", at);
	}

	/** 파일 정보 삽입 DAO
	 *  작성자 mang
	 * @param at
	 * @return
	 */
	public int insertPAttachment(PAttachment at) {
		return sqlSession.insert("placeMapper.insertPAttachment", at);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** place 게시글 삭제 DAO
	 * 작성자 mang
	 * @param placeNo
	 * @return
	 */
	public int deletePlace(int placeNo) {
		return sqlSession.update("placeMapper.deletePlace", placeNo);
	}

	/** 즐겨찾기 DAO
	 * 작성자 mang
	 * @param map
	 * @return result
	 */
	public int insertScrap(Map<String, Integer> map) {
		return sqlSession.insert("placeMapper.insertScrap", map);
	}

	/** 즐겨찾기 취소 DAO
	 * 작성자 mang
	 * @param map
	 * @return result
	 */
	public int deleteScrap(Map<String, Integer> map) {
		return sqlSession.delete("placeMapper.deleteScrap", map);
	}

	/** 즐겨찾기 수 카운트 DAo
	 * 작성자 mang
	 * @param placeNo
	 * @return result
	 */
	public int selectScrapCount(int placeNo) {
		return sqlSession.selectOne("placeMapper.selectScrapCount", placeNo);
	}

	/** 자신이 즐겨찾기 한 글인지 조회 DAO
	 * 작성자 mang
	 * @param map
	 * @return result
	 */
	public int selectScrapFl(Map<String, Integer> map) {
		return sqlSession.selectOne("placeMapper.selectScrapFl", map);
	}

	/** 검색조건이 포함된 페이징 처리 객체 생성 DAO
	 * 작성자 mang
	 * @param search
	 * @return listCount
	 */
	public int getSearchListCount(SearchPlace search) {
		
		return sqlSession.selectOne("placeMapper.getSearchListCount", search);
	}

	/** 검색 조건이 포함된 게시글 목록 조회 DAO
	 * @param search
	 * @param pInfo
	 * @return pList
	 */
	public List<VPlace> selectSearchList(SearchPlace search, PlacePageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("placeMapper.selectSearchList", search, rowBounds);
	}

	/** 파일 정보 삭제 DAO
	 * 작성자 mang
	 * @param fileNo
	 * @return result
	 */
	public int deletePAttachment(int fileNo) {
		return sqlSession.delete("placeMapper.deletePAttachment", fileNo);
	}

	/** 파일 정보 일괄 삭제 DAO
	 * 작성자 mang
	 * @param deleteFileNoList
	 * @return result
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("placeMapper.deleteAttachmentList", deleteFileNoList);
	}



	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
