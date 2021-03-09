package com.kh.ehshe.place.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.Place;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
import com.kh.ehshe.place.model.vo.SearchPlace;
import com.kh.ehshe.place.model.vo.VPlace;

public interface PlaceService {

	/** 페이징 처리 객체 생성 Service
	 * @param cp
	 * @return pInfo
	 */
	PlacePageInfo getPlacePageInfo(int cp);

	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return pList
	 */
	List<VPlace> selectList(PlacePageInfo pInfo);

	List<VPlace> selectrastList(PlacePageInfo pInfo);
	
	List<VPlace> selectbestList(PlacePageInfo pInfo);
	
	/** 썸네일 목록 조회 Service
	 * @param pList
	 * @return thList
	 */
	List<PAttachment> selectThumbnailList(List<VPlace> pList);

	/** 게시글 상세 조회 Service
	 * @param placeNo
	 * @param type 
	 * @return place
	 */
	VPlace selectPlace(int placeNo);

	/** 게시글 상세 조회 썸네일 Service 
	 * @param boardNo
	 * @return Thumbnail
	 */
	List<PAttachment> selectAttachmentList(int placeNo);

	/** 게시글 삽입 Service
	 * @param map
	 * @param image
	 * @param thumbnailSavePath
	 * @param contentsavePath
	 * @return result
	 */
	int insertPlace(Map<String, Object> map, List<MultipartFile> image, String thumbnailSavePath,
			String contentsavePath);

	/** 파일 이미지 삽입 Service
	 * @param uploadFile
	 * @param cSavePath
	 * @return result
	 */
	PAttachment insertImage(MultipartFile uploadFile, String cSavePath);

	/** 게시글 삭제 Service
	 * @param placeNo
	 * @return result 
	 */
	int deletePlace(int placeNo);

	/** 즐겨찾기 Service
	 * @param map
	 * @return result
	 */
	int insertScrap(Map<String, Integer> map);

	/** 즐겨찾기 취소 Service
	 * @param map
	 * @return result
	 */
	int deleteScrap(Map<String, Integer> map);

	/** 즐겨찾기 수 카운트 Service
	 * @param placeNo
	 * @return result
	 */
	int selectScrapCount(int placeNo);

	/** 자신이 즐겨찾기한 글인지 조회 Service
	 * @param map
	 * @return result
	 */
	int selectScrapFl(Map<String, Integer> map);

	/** 검색 조건이 포함된 페이징 처리  객체 생성 Service
	 * @param search
	 * @param cp
	 * @return pInfo
	 */
	PlacePageInfo getSearchPageInfo(SearchPlace search, int cp);

	/** 검색 조건이 포함된 게시글 목록 조회 Service
	 * @param pInfo
	 * @param search
	 * @return pList
	 */
	List<VPlace> selectSearchList(PlacePageInfo pInfo, SearchPlace search);

	/** Place 게시글 수정
	 * @param updatePlace
	 * @param image
	 * @param tSavePath
	 * @return result
	 */
	int updatePlace(Place updatePlace, List<MultipartFile> image, String tSavePath);



}
