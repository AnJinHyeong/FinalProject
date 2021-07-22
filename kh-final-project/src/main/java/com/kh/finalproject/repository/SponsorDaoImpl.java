package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.SponsorDto;

@Repository
public class SponsorDaoImpl implements SponsorDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(SponsorDto sponsorDto) {
		sqlSession.insert("sponsor.insert", sponsorDto);
	}
}
