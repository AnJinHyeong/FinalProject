package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ItemDto;

public interface ItemDao {
	// 아이템Dto 아이템테이블에 등록하기
	void insert(ItemDto itemDto);
	// projectNo를 이용해서 itemList 가져오기
	List<ItemDto> list(int projectNo);
	// projectNo에 맞는 item의 갯수
	int count(int projectNo);
	// 아이템 삭제
	boolean delete(int itemNo);
	// itemNo로 item객체 가져오기
	ItemDto get(int itemNo);
}
