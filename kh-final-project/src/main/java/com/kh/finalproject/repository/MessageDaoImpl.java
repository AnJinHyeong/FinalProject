package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MessageDto;


@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void msgWrite2(MessageDto messageDto) {
		
		sqlSession.insert("member.msgInsert",messageDto);
		
	}


	@Override
	public List<MessageDto> list(int memberNo) {
		List<MessageDto> messageDto = sqlSession.selectList("member.msglist", memberNo);
		return messageDto;
	}
	
	@Override
	public List<MessageDto> list2(int memberNo) {
		List<MessageDto> messageDto = sqlSession.selectList("member.msglist2", memberNo);
		return messageDto;
	}


	@Override
	public List<MessageDto> list3(int memberNo) {
		List<MessageDto> messageDto = sqlSession.selectList("member.msglist3", memberNo);
		return messageDto;
	}

}
