package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GiftDto {
	private int giftNo;
	private int projectNo;
	private int memberNo;
	private int giftPrice;
	private String giftSummary;
}
