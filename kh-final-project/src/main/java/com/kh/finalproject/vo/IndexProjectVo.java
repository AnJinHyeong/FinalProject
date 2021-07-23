package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class IndexProjectVo {

	//프로젝트
	private int projectNo;
	private String projectTitle;
	private int projectPercent;
	private String memberInfoNick;
	private String projectState;
	
	//이미지 파일
	private int imageNo;
	
	//카테고리
	private int categoryNo;
	private String categoryTheme;
	
}
