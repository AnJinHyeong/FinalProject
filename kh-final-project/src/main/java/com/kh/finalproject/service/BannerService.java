package com.kh.finalproject.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.entity.ImageDto;

public interface BannerService {
	
	void insertMainBanner(BannerDto bannerDto, MultipartFile bannerImage) throws IllegalStateException, IOException;
}
