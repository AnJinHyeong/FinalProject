package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectReportListVo {
	private int reportNo;
	private int reportProjectNo;
	private String projectTitle;
	private int reportCount;
	private String reportContent;
	private String reportDate;
	
	private String memberNick;
	
}
