package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectProgressVo {
	private int projectNo;
	private String projectTitle;
	private Integer projectTargetAmount;
	private Date projectStartDate;
	private Date projectEndDate;
	private String projectSummary;
	private Integer categoryNo;
	private String memberInfoNick;
	private String memberInfoContent;
	private Integer gCount;
	private Integer iCount;
	private Integer iFCount;
	private String projectContent;
}
