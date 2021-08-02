package com.kh.finalproject.repository;

import java.util.List;


import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.vo.MsgVo;

public interface MessageDao {

	void msgWrite2(MessageDto messageDto);
	
	MessageDto getByMsgNo(int msgNo);
	MsgVo getByMsgNo2(int msgNo);
	
	List<MessageDto> msgAllByMemberNo(int memberNo);
	List<MessageDto> msgSendByMemberNo(int memberNo);
	List<MessageDto> msgReceiverByMemberNo(int memberNo);
	
	boolean deleteMsg(MessageDto messageDto);
	
}
