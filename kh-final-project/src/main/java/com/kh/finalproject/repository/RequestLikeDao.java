package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectLikeDto;
import com.kh.finalproject.entity.RequestLikeDto;
import com.kh.finalproject.vo.ProjectLikeVo;

public interface RequestLikeDao {

	//좋아요 추가
	void add(RequestLikeDto requestLikeDto);
	//좋아요 취소
	boolean delete(RequestLikeDto requestLikeDto);
	//회원 좋아요 확인
	int confirm(RequestLikeDto requestLikeDto);
//	//내가 좋아요한 프로젝트 조회
//	List<ProjectLikeDto> myLikeProject(int memberNo);
//	//내가 좋아요한 프로젝트 리스트 정보 조회
//	List<ProjectLikeVo> myLikeProjectList(int memberNo);
	
}
