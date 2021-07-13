package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.vo.ProjectCategoryVo;

public interface ProjectDao {
	
	//프로젝트 추가
	void insert(ProjectCategoryVo projectCategoryVo);
	//회원이 만든 프로젝트 전체 조회
	List<ProjectDto> list(int memberNo);
	//프로젝트 상세 조회
	ProjectDto get(ProjectDto projectDto);
	//시퀀스를 이용한 프로젝트 생성
	void insertBySequence(ProjectCategoryVo projectCategoryVo);
	//프로젝트 시퀀스 생성
	int sequence();
	//프로젝트 제목 업데이트
	boolean projectUpdate(ProjectDto projectDto);
	
}
