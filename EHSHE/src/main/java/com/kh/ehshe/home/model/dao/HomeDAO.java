package com.kh.ehshe.home.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ehshe.home.model.vo.Item;

@Repository
public class HomeDAO {
	
	private SqlSessionTemplate sqlSession;

	
	
	
	
	/** 아이템 베스트 3 조회
	 * @return list
	 */
	public List<Item> selectItemList() {
		
		return sqlSession.selectList("mainMapper.selectItemList");
	}
}
