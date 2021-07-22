package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SponsorDto {
	private int sponsorNo;
	private int memberNo;
	private Integer giftNo;
	private int projectNo;
	private int sponsorAmount;
	private Date sponsorDate;
}
