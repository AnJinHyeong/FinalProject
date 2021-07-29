package com.kh.finalproject.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BannerVo {
	private int bannerNo;
	private String bannerTitle;
	private String bannerContent;
	private String bannerBackgroundColor;
	private String bannerColor;
	
	private int bannerImageNo;
	private MultipartFile bannerImage;
}
