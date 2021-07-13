package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.CategoryDto;

public interface CategoryDao {
	List<CategoryDto> approveList();
	CategoryDto get(String categoryTheme);
	boolean isExist(String categoryTheme);
	int getSequence();
	void insert(CategoryDto categoryDto);
}
