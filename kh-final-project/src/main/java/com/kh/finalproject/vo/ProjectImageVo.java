package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectImageVo {
	private int projectNo;
	private String projectTitle;
	private String projectContent;
	private String projectContentFile;
	private int projectTargetAmount;
	private int projectPercent;
	private String projectState;
	private Date projectRegistDate;
	private Date projectStartDate;
	private Date projectEndDate;
	private String projectStopCauses;
	private String projectSummary;
	
	private int memberNo;
	private int categoryNo;
	
	private String memberInfoNick;
	private String memberInfoContent;
	
	private int projectLikeCount;
	
	private int imageNo;
}
