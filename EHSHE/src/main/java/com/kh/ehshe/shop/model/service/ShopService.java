package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopPageInfo;

public interface ShopService {

	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	ShopPageInfo getPageInfo(int type, int cp);

	/** shop 게시글 목록 조회 Service
	 * @param pInfo
	 * @return sList
	 */
	List<Shop> selectShopList(ShopPageInfo pInfo);

	
	
	/** shop 게시글 상세조회 Service
	 * @param itemNo
	 * @param type
	 * @return shop
	 */
	Shop selectShopBoard(int itemNo, int type);

	
	
	
	/** Shop 게시글 삽입 Service 
	 * @param map
	 * @param images
	 * @param savePath
	 * @return result
	 */
	int insertShop(Map<String, Object> map, List<MultipartFile> images, String savePath);

	/** 섬머노트 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @param type 
	 * @return at
	 */
	ShopAttachment insertShopImage(MultipartFile uploadFile, String savePath, int type);

	
	
	
}
