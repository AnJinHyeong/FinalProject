package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.vo.RequestVo;

public interface RequestDao {

	//게시글 등록
	void insert(RequestDto requestDto);
	//게시글 전체 조회
	List<RequestVo> selectAll();
	//게시글 번호로 게시글 상세조회
	RequestVo getByRequestNo(int requestNo);
	
}
