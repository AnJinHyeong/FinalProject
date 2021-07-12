package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ItemDto;

public interface ItemDao {
	void insert(ItemDto itemDto);
	List<ItemDto> list(int projectNo);
	int count(int projectNo);
}
