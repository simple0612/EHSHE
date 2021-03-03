package com.kh.ehshe.place.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ehshe.place.model.dao.PlaceDAO;
import com.kh.ehshe.place.model.vo.PAttachment;
import com.kh.ehshe.place.model.vo.PlacePageInfo;
import com.kh.ehshe.place.model.vo.VPlace;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	private PlaceDAO dao;
	
	@Override
	public PlacePageInfo getPlacePageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new PlacePageInfo(cp, listCount);
	}

	// 게시글 목록 조회 service 구현
	@Override
	public List<VPlace> selectList(PlacePageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 썸네일 목록 조회 Service 구현
	@Override
	public List<PAttachment> selectThumbnailList(List<VPlace> pList) {
		return dao.selectThumbnailList(pList);
	}
	
	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public VPlace selectPlace(int placeNo) {
		
		VPlace place = dao.selectPlace(placeNo);
		
		if(place != null) {
			int result = dao.increaseReadCount(placeNo);
			
			if (result > 0) { // DB 조회수 증가 성공 시
				// 먼저 조회된 board의 조회수도 1증가
				place.setReadCount(place.getReadCount() + 1);
			}
		}
		return place;
	}
	
	// 게시글 이미지 조회 Service 구현
	@Override
	public List<PAttachment> selectAttachmentList(int placeNo) {
		return dao.selectAttachmentList(placeNo);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
