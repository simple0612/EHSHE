package com.kh.ehshe.place.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ehshe.board.model.vo.VBReply;
import com.kh.ehshe.place.model.vo.PReview;
import com.kh.ehshe.place.model.vo.VPReview;
import com.kh.ehshe.board.model.vo.BReply;

public interface ReviewService {

	public abstract List<VPReview> selectReviewList(int parentPlaceNo);

	public abstract int insertReview(Map<String, Object> map);

	public abstract int updateReview(PReview review);

	public abstract int deleteReview(int reviewNo);

}
