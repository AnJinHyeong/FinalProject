package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjectAdminSearchVo {

	private int projectNo;
	private String projectTitle;
	private String projectContent;
	private String projectContentFile;
	private int projectTargetAmount;
	private int projectPercent;
	private String projectState;
	private String projectRegistDate;
	private String projectStartDate;
	private String projectEndDate;
	private String projectStopCauses;
	private String projectSummary;
	private int memberNo;
	private int categoryNo;
	private String memberInfoNick;
	private String memberInfoContent;
	private int projectLikeCount;
	private String projectAmountGive;

	private String categoryTheme;
	
	private String memberNick;
	private int imageNo;
	
}
