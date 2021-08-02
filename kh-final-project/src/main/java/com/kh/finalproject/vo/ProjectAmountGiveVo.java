package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectAmountGiveVo {
	private int projectNo;
	private int memberNo;
	private int projectPercent;
	private String projectEndDate;
	private String projectState;
	private String projectAmountGive;
	
	private int sponsorMemberNo;
	private int sponsorAmount;
}
