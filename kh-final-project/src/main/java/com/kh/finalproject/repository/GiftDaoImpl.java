package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.GiftDto;

@Repository
public class GiftDaoImpl implements GiftDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(GiftDto giftDto) {
		sqlSession.insert("gift.insert", giftDto);
	}

	@Override
	public List<GiftDto> listByProjectNo(int projectNo) {
		return sqlSession.selectList("gift.listByProjectNo", projectNo);
	}

	@Override
	public int count(int projectNo) {
		return sqlSession.selectOne("gift.count", projectNo);
	}

}
