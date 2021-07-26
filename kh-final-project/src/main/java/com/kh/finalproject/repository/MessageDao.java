package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MessageDto;

public interface MessageDao {

	void msgWrite2(MessageDto messageDto);
	List<MessageDto> list(int memberNo);
	List<MessageDto> list2(int memberNo);
	List<MessageDto> list3(int memberNo);
}
