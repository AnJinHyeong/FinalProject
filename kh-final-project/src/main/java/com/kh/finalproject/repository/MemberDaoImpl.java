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
	public boolean checkId(String memberId) {
		return sqlSession.selectOne("member.checkId", memberId) != null;
	}
	
	@Override
	public void memberInsert(MemberDto memberDto) {
		sqlSession.insert("member.insert",memberDto);
	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		return sqlSession.selectOne("member.login", memberDto);
	}

	@Override
	public MemberDto getByMemberNo(int memberNo) {
		return sqlSession.selectOne("member.getByMemberNo",memberNo);
	}

	@Override
	public int selectHavePoint(int memberHavePoint) {
		return sqlSession.selectOne("member.selectHavePoint", memberHavePoint);
	}

}
