package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.vo.CategoryVo;

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

	@Override
	public String approveCheck(int categoryNo) {
		return sqlSession.selectOne("category.approveCheck",categoryNo);
	}

	@Override
	public CategoryDto getByNo(int categoryNo) {
		return sqlSession.selectOne("category.getByNo",categoryNo);
	}

	@Override
	public List<CategoryDto> childCategoryList(int categoryNo) {
		return sqlSession.selectList("category.childCategoryList",categoryNo);
	}

	@Override
	public List<CategoryVo> getCategoryList() {
		return sqlSession.selectList("category.getCategoryList");
	}

	@Override
	public void deleteCategoryByCategoryNo(int categoryNo) {
		sqlSession.delete("category.deleteCategoryByCategoryNo", categoryNo);
	}

	@Override
	public void categorySetApproveY(int categoryNo) {
		sqlSession.update("category.categorySetApproveY", categoryNo);
	}

	@Override
	public void categoryInsert(CategoryVo categoryVo) {
		sqlSession.insert("category.categoryInsert", categoryVo);
	}
	
}
