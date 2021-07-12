package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryDto> approveList() {
		return sqlSession.selectList("category.approveList");
	}

	
}
