package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectCommunityDto;

public interface ProjectCommunityDao {
	
	//커뮤니티 등록
	void insert(ProjectCommunityDto projectCommunityDto);
	//프로젝트 번호로 커뮤니티 리스트 조회
	List<ProjectCommunityDto> listByProjectNo(int projectNo);
	//프로젝트 번호로 커뮤니티 리스트 + member 테이블 조회
	List<ProjectCommunityDto> listByProjectNo2(int projectNo);
	//커뮤니티 삭제(projectCommunity, memberNo)
	boolean delete(ProjectCommunityDto projectCommunityDto);
	//창작자가 커뮤니티 삭제(projectCommunityNo, projectNo)
	boolean deleteByProjectNo(ProjectCommunityDto projectCommunityDto);
	
	
}
