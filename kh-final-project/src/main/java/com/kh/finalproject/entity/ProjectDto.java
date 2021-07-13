package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectDto {
	private int projectNo;
	private String projectTitle;
	private String projectContent;
	private int projectTargetAmount;
	private int projectPercente;
	private String projectState;
	private Date projectRegistDate;
	private Date projectStartDate;
	private Date projectEndDate;
	private String projectStopCaues;
	private String projectSummary;
	
	private int memberNo;
	private int categoryNo;
}
