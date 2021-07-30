package com.kh.finalproject.repository;

import java.util.List;


import com.kh.finalproject.entity.MessageDto;

public interface MessageDao {

	void msgWrite2(MessageDto messageDto);
	
	MessageDto getByMsgNo(int msgNo);
	
	List<MessageDto> msgAllByMemberNo(int memberNo);
	List<MessageDto> msgSendByMemberNo(int memberNo);
	List<MessageDto> msgReceiverByMemberNo(int memberNo);
	
	
}
