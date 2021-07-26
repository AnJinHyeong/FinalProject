package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.entity.SponsorDto;

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
	public int selectHavePoint(int memberNo) {
		return sqlSession.selectOne("member.selectHavePoint", memberNo);
	}
	
	@Override
	public int getMemberHavePoint(int memberNo) {
		return sqlSession.selectOne("member.getMemberHavePoint", memberNo);
	}

	@Override
	public void usePoint(SponsorDto sponsorDto) {
		sqlSession.update("member.usePoint", sponsorDto);
	}

	@Override
	public void addPointBySponsorCancel(SponsorDto sponsorDto) {
		sqlSession.update("member.addPointBySponsorCancel", sponsorDto);
	}
	
	@Override
	public List<PayDto> list(int memberNo) {
		return sqlSession.selectList("pay.list",memberNo);
	}

}
