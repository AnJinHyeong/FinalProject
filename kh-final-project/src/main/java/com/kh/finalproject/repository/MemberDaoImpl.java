package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto idCheck(String memberId) {
		return sqlSession.selectOne("member.idCheck", memberId);
	}
	

	
	@Override
	public void memberInsert(MemberDto memberDto) {
		sqlSession.insert("member.insert",memberDto);
	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		return sqlSession.selectOne("member.login", memberDto);
	}

}
