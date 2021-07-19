package com.kh.finalproject.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class GiftSelectedItemVo {
	private int giftNo;
	private int projectNo;
	private int memberNo;
	private int giftPrice;
	private String giftSummary;
	
	List<ItemListVo> itemList;
}
