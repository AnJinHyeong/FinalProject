package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.vo.member.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVo idCheck(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.idCheck", memberId);
	}

	@Override
	public MemberVo memberInsert(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int memberNo = sqlSession.selectOne("member.sequence");
		memberVo.setMemberNo(memberNo);
		sqlSession.insert("member.insert", memberVo);
		return memberVo; 
		
	}

	@Override
	public MemberVo memberNoSequence(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.get",memberVo);
	}

}
