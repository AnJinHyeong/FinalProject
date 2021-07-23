package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectInformationVo {
	private int projectNo;
	private String projectTitle;
	private int projectTargetAmount;
	private int projectPercent;
	private String projectState;
	private String projectStartDateString;
	private String projectEndDateString;
	
	private int memberNo;
	private int categoryNo;
	
	private String memberInfoNick;
	
	private int sumSponsorAmountByOne;
	private int sumCurrentAmountByAll;
}
