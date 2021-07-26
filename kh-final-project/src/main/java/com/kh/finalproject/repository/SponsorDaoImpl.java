package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.vo.SponsorListVo;
import com.kh.finalproject.vo.SponsorVo;

@Repository
public class SponsorDaoImpl implements SponsorDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(SponsorDto sponsorDto) {
		sqlSession.insert("sponsor.insert", sponsorDto);
	}

	@Override
	public int currentAmount(int projectNo) {
		if(sqlSession.selectOne("sponsor.currentAmount", projectNo) != null) {
			return sqlSession.selectOne("sponsor.currentAmount", projectNo);
		}
		else {
			return 0;
		}
	}

	@Override
	public int currentSponsorMemberCount(int projectNo) {
		return sqlSession.selectOne("sponsor.currentSponsorMemberCount", projectNo);
	}

	@Override
	public List<SponsorVo> sponsorStartedProjectListByMemberNo(int memberNo) {
		return sqlSession.selectList("sponsor.sponsorStartedProjectListByMemberNo", memberNo);
	}
	
	@Override
	public List<SponsorVo> sponsorFinishedProjectListByMemberNo(int memberNo) {
		return sqlSession.selectList("sponsor.sponsorFinishedProjectListByMemberNo", memberNo);
	}
	
	@Override
	public List<SponsorVo> sponsorCanceledProjectListByMemberNo(int memberNo) {
		return sqlSession.selectList("sponsor.sponsorCanceledProjectListByMemberNo", memberNo);
	}

	@Override
	public int sponsorAmountByProjectNoAndMemberNo(SponsorVo sponsorVo) {
		Integer target = sqlSession.selectOne("sponsor.sponsorAmountByProjectNoAndMemberNo", sponsorVo);
		if(target != null) {
			return target;
		}
		else {
			return 0;
		}
	}

	@Override
	public List<SponsorListVo> sponsorListByProjectNo(SponsorDto sponsorDto) {
		return sqlSession.selectList("sponsor.sponsorListByProjectNo", sponsorDto);
	}
	
	@Override
	public List<SponsorListVo> sponsorCanceledListByProjectNo(SponsorDto sponsorDto) {
		return sqlSession.selectList("sponsor.sponsorCanceledListByProjectNo", sponsorDto);
	}

	@Override
	public boolean sponsorCancel(SponsorDto sponsorDto) {
		return sqlSession.update("sponsor.sponsorCancel", sponsorDto) > 0;
	}

	@Override
	public SponsorDto getSponsor(SponsorDto sponsorDto) {
		return sqlSession.selectOne("sponsor.getSponsor", sponsorDto);
	}
}
