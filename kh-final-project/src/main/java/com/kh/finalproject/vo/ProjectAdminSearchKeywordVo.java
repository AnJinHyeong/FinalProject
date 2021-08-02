package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjectAdminSearchKeywordVo {

	private String searchType;
	private String projectState;
	private String keyword;
	
}
