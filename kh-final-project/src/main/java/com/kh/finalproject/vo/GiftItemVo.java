package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GiftItemVo {
	private int giftItemNo;
	private int giftNo;
	private int itemNo;
	private int itemCount;
	
	private int projectNo;
	
	private String itemName;
}
