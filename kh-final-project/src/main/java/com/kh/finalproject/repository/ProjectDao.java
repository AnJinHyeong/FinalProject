package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.vo.ProjectCategoryVo;

public interface ProjectDao {
	
	//프로젝트 추가
	void insert(ProjectCategoryVo projectCategoryVo);
	//프로젝트 조회
	List<ProjectDto> list(int memberNo);
	//프로젝트 상세 조회
	ProjectDto listOne(ProjectDto projectDto);
	
}
