package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.vo.MemberVo;
import com.kh.finalproject.vo.MsgVo;


@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	
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
	public boolean changePassword(MemberVo memberVo) {
		int count = sqlSession.update("member.upPw2", memberVo);
		return count > 0;
	}



	@Override
	public boolean updateIntro(MemberDto memberDto) {
		int count = sqlSession.update("member.upIntro", memberDto);
		return count > 0;
	}
	
	
	@Override
	public boolean updateNick(MemberDto memberDto) {
		int count = sqlSession.update("member.upNick", memberDto);
		return count >0;
	}
	
	@Override
	public boolean updateAddress(MemberDto memberDto) {
		int count = sqlSession.update("member.upAddress",memberDto);
		return count > 0;
	}



	@Override
	public boolean checkId(String memberId) {
		return sqlSession.selectOne("member.checkId", memberId) != null;
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
	public void addPoint(SponsorDto sponsorDto) {
		sqlSession.update("member.addPoint", sponsorDto);
	}
	
	@Override
	public List<PayDto> list(int memberNo) {
		return sqlSession.selectList("pay.list",memberNo);
	}



	@Override
	public void usePoint(SponsorDto sponsorDto) {
		sqlSession.update("member.usePoint", sponsorDto);
	}

	@Override
	public boolean checkEmail(String memberEmail) {
		return sqlSession.selectOne("member.checkEmail", memberEmail) != null;
	}

}
