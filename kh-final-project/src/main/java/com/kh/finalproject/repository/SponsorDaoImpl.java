package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.entity.SponsorDto;
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
	public List<SponsorVo> sponsorProjectListByMemberNo(int memberNo) {
		return sqlSession.selectList("sponsor.sponsorProjectListByMemberNo", memberNo);
	}

	@Override
	public int sponsorAmountByProjectNoAndMemberNo(SponsorVo sponsorVo) {
		return sqlSession.selectOne("sponsor.sponsorAmountByProjectNoAndMemberNo", sponsorVo);
	}
}
