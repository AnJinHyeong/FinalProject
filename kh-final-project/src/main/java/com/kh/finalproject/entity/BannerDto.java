package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BannerDto {
	private int bannerNo;
	private String bannerTitle;
	private String bannerContent;
	private String bannerBackgroundColor;
	private String bannerColor;
}
