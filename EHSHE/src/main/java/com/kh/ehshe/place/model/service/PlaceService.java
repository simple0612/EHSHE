package com.kh.ehshe.place.model.service;

import java.util.List;

import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
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

}
