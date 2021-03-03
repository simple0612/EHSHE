package com.kh.ehshe.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.ehshe.shop.model.vo.Shop;
import com.kh.ehshe.shop.model.vo.ShopAttachment;
import com.kh.ehshe.shop.model.vo.ShopOption;
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

	
	
	/** 썸네일 목록 조회 Service
	 * @param sList
	 * @return thList
	 */
	List<ShopAttachment> selectShopThumbnailList(List<Shop> sList);

	
	
	/** shop 게시글 상세조회 Service
	 * @param itemNo
	 * @param type
	 * @return shop
	 */
	Shop selectShopBoard(int itemNo, int type);

	
	/** shop 포함된 이미지 목록 조회 Service
	 * @param itemNo
	 * @return ShopAttachmentList
	 */
	ShopAttachment selectShopAttachmentList(int itemNo);
	
	/** shop 옵션 목록 조회 Service
	 * @param itemNo
	 * @return ShopOptionList
	 */
	List<ShopOption> selectShopOptionList(int itemNo);

	
	
	/** Shop 게시글 삽입 Service 
	 * @param map
	 * @param images
	 * @param savePath
	 * @param colormenu 
	 * @param sizemenu 
	 * @return result
	 */
	int insertShop(Map<String, Object> map, List<MultipartFile> images, String savePath, List<String> sizemenu, List<String> colormenu);

	/** 섬머노트 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @param type 
	 * @return ㅁ
	 */
	ShopAttachment insertShopImage(MultipartFile uploadFile, String savePath, int type);

	/* shop 게시글 수정 Service
	 * @param updateShopBoard
	 * @param images
	 * @param savePath
	 * @return result
	 */
	int updateShopBoard(Shop updateShopBoard, MultipartFile images, String savePath);

	/** 메인 페이지 최근올라온 상품 Service
	 * @return sList
	 */
	List<Shop> selectShopMainList();

	/** 메인 페이지 최근순 썸네일 조회하기
	 * @param sList
	 * @return mThList
	 */
	List<ShopAttachment> selectMainAttachmentlList(List<Shop> sList);
	
	
	




	
	
	
}
