package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SponsorVo {
	private int projectNo;
	private String projectTitle;
	private int sumSponsorAmount;
	
	private int memberNo;
}
