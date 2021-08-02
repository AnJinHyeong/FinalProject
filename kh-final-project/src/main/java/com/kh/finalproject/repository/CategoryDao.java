package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.vo.CategoryVo;

public interface CategoryDao {
	List<CategoryDto> approveList();
	List<CategoryDto> userCustomList(int categoryNo);
	CategoryDto get(String categoryTheme);
	boolean isExist(String categoryTheme);
	int getSequence();
	void insert(CategoryDto categoryDto);
	//카테고리 번호를 이용한 approve상태 확인
	String approveCheck(int categoryNo);
	//카테고리 번호를 이용한 category 조회
	CategoryDto getByNo(int categoryNo);
	//자식 카테고리 조회
	List<CategoryDto> childCategoryList(int categoryNo);
	// 카테고리 목록 조회(상위 카테고리명도)
	List<CategoryVo> getCategoryList();
	// 카테고리 번호로 카테고리 지우기
	void deleteCategoryByCategoryNo(int categoryNo);
	// 카테고리 승인
	void categorySetApproveY(int categoryNo);
	// 카테고리 관리자 등록
	void categoryInsert(CategoryVo categoryVo);
}
