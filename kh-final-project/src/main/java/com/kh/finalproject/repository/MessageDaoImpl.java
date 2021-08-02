package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.vo.MsgVo;


@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void msgWrite2(MessageDto messageDto) {
		
		sqlSession.insert("member.msgInsert",messageDto);
		
	}




	@Override
	public List<MessageDto> msgAllByMemberNo(int memberNo) {
		
		return sqlSession.selectList("member.msgAllByMemberNo",memberNo);
	}


	@Override
	public List<MessageDto> msgSendByMemberNo(int memberNo) {
		return sqlSession.selectList("member.msgSendByMemberNo",memberNo);
	}


	@Override
	public List<MessageDto> msgReceiverByMemberNo(int memberNo) {
		return sqlSession.selectList("member.msgReceiverByMemberNo",memberNo);
	}




	@Override
	public MessageDto getByMsgNo(int msgNo) {
		return sqlSession.selectOne("member.getByMsgNo",msgNo);
	}
	
	@Override
	public MsgVo getByMsgNo2(int msgNo) {
		return sqlSession.selectOne("member.getByMsgNo2",msgNo);
	}




	@Override
	public boolean deleteMsg(MessageDto messageDto) {
		int count = sqlSession.delete("member.deleteByMsg",messageDto);
		return count > 0;
	}
	
	

}
