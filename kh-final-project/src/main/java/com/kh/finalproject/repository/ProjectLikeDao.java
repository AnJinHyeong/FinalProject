package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectLikeDto;
import com.kh.finalproject.vo.ProjectLikeVo;

public interface ProjectLikeDao {
	
	//좋아요 추가
	void add(ProjectLikeDto projectLikeDto);
	//좋아요 취소
	boolean delete(ProjectLikeDto projectLikeDto);
	//회원 좋아요 확인
	int confirm(ProjectLikeDto projectLikeDto);
	//내가 좋아요한 프로젝트 조회
	List<ProjectLikeDto> myLikeProject(int memberNo);
	//내가 좋아요한 프로젝트 리스트 정보 조회
	List<ProjectLikeVo> myLikeProjectList(int memberNo);
	
}
