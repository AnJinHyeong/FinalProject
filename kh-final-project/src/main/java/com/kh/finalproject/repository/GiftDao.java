package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.GiftDto;

public interface GiftDao {
	// GiftDto 데이터 삽입
	void insert(GiftDto giftDto);
	// 프로젝트 번호를 이용해서 선물 리스트 불러오기
	List<GiftDto> listByProjectNo(int projectNo);
	// projectNo에 맞는 gift의 갯수
	int count(int projectNo);
}
