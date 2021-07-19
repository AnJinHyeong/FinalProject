package com.kh.finalproject.repository;

import java.sql.Date;
import java.util.List;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.vo.ProjectCategoryVo;
import com.kh.finalproject.vo.ProjectDatePlusVo;

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
	//프로젝트 Default 업데이트
	boolean projectDefaultUpdate(ProjectDto projectDto);
	//프로젝트 Funding 업데이트
	boolean projectFundingUpdate(ProjectDto projectDto);
	//endDate에 7 더하기
	String projectEndDatePlus7(int projectNo);
	//endDate에 14 더하기
	String projectEndDatePlus14(int projectNo);
	//작업 진행중인 프로젝트 조회
	ProjectDto workingProject(int memberNo);
	//프로젝트 member(창작자) 업데이트
	boolean projectMemberUpdate(ProjectDto projectDto);
	// 프로젝트 Story 업데이트
	boolean projectStoryUpdate(ProjectDto projectDto);
	
}
