package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SponsorListVo {
	private int sponsorNo;
	private int memberNo;
	private Integer giftNo;
	private int projectNo;
	private int sponsorAmount;
	private String sponsorDate;
	
	private String giftSummary;
}
