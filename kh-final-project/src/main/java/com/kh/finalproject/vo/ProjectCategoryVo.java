package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectCategoryVo {
	private int projectNo;
	private String projectSummary;
	private String projectTitle;
	
	private int memberNo;
	
	private int categoryNo;
	private String categoryTheme;
}
