package com.kh.ehshe.place.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
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
	 * @param boardNo
	 * @return Thumbnail
	 */
	public PAttachment selectAttachment(int placeNo) {
		return sqlSession.selectOne("placeMapper.selectAttachment", placeNo);
	}
	
	/** 게시글 이미지 목록 조회 DAO
	 * 작성자 mang
	 * @param boardNo
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
