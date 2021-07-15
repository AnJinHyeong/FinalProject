package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ItemDto;

@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ItemDto itemDto) {
		sqlSession.insert("item.insert", itemDto);
	}

	@Override
	public List<ItemDto> list(int projectNo) {
		return sqlSession.selectList("item.list", projectNo);
	}

	@Override
	public int count(int projectNo) {
		return sqlSession.selectOne("item.count", projectNo);
	}

	@Override
	public boolean delete(int itemNo) {
		return sqlSession.delete("item.delete", itemNo) > 0;
	}

	@Override
	public ItemDto get(int itemNo) {
		return sqlSession.selectOne("item.get", itemNo);
	}

}
