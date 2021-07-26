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

	@Override
	public MemberDto getByMemberNo(int memberNo) {
		return sqlSession.selectOne("member.getByMemberNo",memberNo);
	}



	@Override
	public MemberDto getByMemberEmail(String memberEmail) {
		return sqlSession.selectOne("member.getId",memberEmail);
	}



	@Override
	public void updatePw(MemberDto memberDto) {
		sqlSession.update("member.pwUp",memberDto);
		
	}



	@Override
	public boolean updateEmail(MemberDto memberDto) {
		int count =sqlSession.update("member.upEmail",memberDto);
		return count > 0;
		
	}



	@Override
	public boolean changePassword(MemberDto memberDto) {
		int count = sqlSession.update("member.upPw2", memberDto);
		return count > 0;
	}



	@Override
	public boolean updateIntro(MemberDto memberDto) {
		int count = sqlSession.update("member.upIntro", memberDto);
		return count > 0;
	}

}
