package com.kh.finalproject.repository;

import com.kh.finalproject.entity.BannerDto;

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
}
