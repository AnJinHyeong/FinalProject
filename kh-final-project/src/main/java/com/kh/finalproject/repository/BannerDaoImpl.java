package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.vo.BannerVo;

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

	@Override
	public List<BannerVo> getBannerList() {
		return sqlSession.selectList("banner.getBannerList");
	}

	@Override
	public void deleteBannerByBannerNo(int bannerNo) {
		sqlSession.delete("banner.deleteBannerByBannerNo", bannerNo);
	}

}
