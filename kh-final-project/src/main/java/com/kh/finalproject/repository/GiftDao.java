package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.GiftDto;
import com.kh.finalproject.vo.GiftItemVo;
import com.kh.finalproject.vo.ItemListVo;

public interface GiftDao {
	// GiftDto 데이터 삽입
	void insert(GiftDto giftDto);
	// 프로젝트 번호를 이용해서 선물 리스트 불러오기
	List<GiftDto> listByProjectNo(int projectNo);
	// projectNo에 맞는 gift의 갯수
	int count(int projectNo);
	// giftNo를 이용해서 gift 삭제
	void delete(int giftNo);
	// 시퀀스 생성
	int getSequence();
	// 시퀀스로 GiftDto 데이터 삽입
	void insertBySequence(GiftDto giftDto);
	
	
	// giftItem에 데이터 입력 반복문 사용예정
	void insert(List<ItemListVo> itemList, int giftNo);
	
	// GiftItemVo를 통해 데이터 리스트 불러오기
	List<GiftItemVo> list();
}
