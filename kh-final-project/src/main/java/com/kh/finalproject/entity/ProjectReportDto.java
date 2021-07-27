package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjectReportDto {
	
	private int reportNo;
	private int reportProjectNo;
	private int reportMemberNo;
	private String reportContent;
	private Date reportDate;
	
}
