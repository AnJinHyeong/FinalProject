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
	
	// 메시지 전체 가져오기
	List<MsgVo> msgAll();

	// 닉네임 조회 메시지 가져오기
	List<MsgVo> msgAll(String keyword);
	
	
	//admin 메세지 상세보기
	MsgVo adminMsgSelectOne(int msgNo);
}
