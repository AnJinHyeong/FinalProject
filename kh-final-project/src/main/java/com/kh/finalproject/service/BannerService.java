package com.kh.finalproject.service;

import java.io.IOException;

import com.kh.finalproject.vo.BannerVo;

public interface BannerService {
	
	void insertMainBanner(BannerVo bannerVo) throws IllegalStateException, IOException;
	
	void deleteMainBanner(BannerVo bannerVo);
}
