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
	
	@Override
	public List<CategoryDto> userCustomList(int categoryNo) {
		return sqlSession.selectList("category.userCustomList",categoryNo);
	}

	@Override
	public CategoryDto get(String categoryTheme) {
		return sqlSession.selectOne("category.get", categoryTheme);
	}

	@Override
	public boolean isExist(String categoryTheme) {
		return sqlSession.selectOne("category.get", categoryTheme) != null;
	}

	@Override
	public int getSequence() {
		return sqlSession.selectOne("category.sequence");
	}

	@Override
	public void insert(CategoryDto categoryDto) {
		sqlSession.insert("category.insert", categoryDto);
	}

	
	
}
