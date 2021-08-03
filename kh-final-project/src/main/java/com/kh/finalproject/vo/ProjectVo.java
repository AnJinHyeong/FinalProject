package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectVo {
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
}
