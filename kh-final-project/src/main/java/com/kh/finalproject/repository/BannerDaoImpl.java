package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.BannerDto;

@Repository
public class BannerDaoImpl implements BannerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BannerDto getBanner(int bannerNo) {
		return sqlSession.selectOne("banner.getBanner", bannerNo);
	}

	@Override
	public BannerDto getBannerByIndexNo(int indexNo) {
		return sqlSession.selectOne("banner.getBannerByIndexNo", indexNo);
	}

	@Override
	public void insertBanner(BannerDto bannerDto) {
		sqlSession.insert("banner.insertBanner", bannerDto);
	}

	@Override
	public int getSequence() {
		return sqlSession.selectOne("banner.getSequence");
	}

	@Override
	public void insertBannerBySequence(BannerDto bannerDto) {
		sqlSession.insert("banner.insertBannerBySequence", bannerDto);
	}

}
