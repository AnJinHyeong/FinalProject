package com.kh.finalproject.vo;

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
	private String projectStartDate;
	private String projectEndDate;
	
	private int memberNo;
	private int categoryNo;
	
	private String memberInfoNick;
	
	private int sumSponsorAmountByOne;
	private int sumCurrentAmountByAll;
}
