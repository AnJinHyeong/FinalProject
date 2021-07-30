package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.vo.BannerVo;

public interface BannerDao {

	// 시퀀스 얻기
	int getSequence();
	// 배너번호로 배너정보 가져오기
	BannerDto getBanner(int bannerNo);
	// 인덱스로 배너정보 가져오기
	BannerDto getBannerByIndexNo(int indexNo);
	// 배너 등록
	void insertBanner(BannerDto bannerDto);
	// 시퀀스로 배너 등록
	void insertBannerBySequence(BannerDto bannerDto);
	// 배너 목록 가져오기
	List<BannerVo> getBannerList();
	// 배너 지우기
	void deleteBannerByBannerNo(int bannerNo);
}
