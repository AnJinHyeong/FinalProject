package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ImageDto {
	
	private int imageNo;
	private String imageUploadName;
	private String imageSaveName;
	private String imageContentType;
	private long imageSize;
	
	private int projectNo;
	private String projectState;
	private int memberNo;
	
}
