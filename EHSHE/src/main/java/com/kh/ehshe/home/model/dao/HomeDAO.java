package com.kh.ehshe.home.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.home.model.vo.Item;
import com.kh.ehshe.home.model.vo.TopItem;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	
	/** 아이템 베스트 3 조회
	 * @return list
	 */
	public List<Item> selectItemList(List<TopItem> tList) {
		
		return sqlSession.selectList("mainMapper.selectItemList", tList);
	}
	
	
	
	/** 아이템 평점 탑 3 조회
	 * @return list
	 */
	public List<TopItem> selectTopList() {
		
		return sqlSession.selectList("mainMapper.selectTopList");
	}
}
