package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProjectSponsorVo {
	private int sponsorNo;
	private int memberNo;
	private Integer giftNo;
	private int projectNo;
	private int sponsorAmount;
	private Date sponsorDate;
	
	private String memberNick;
	private String memberEmail;
	private String memberAddress;
	
	private int giftPrice;
	private String giftSummary;
	
}
