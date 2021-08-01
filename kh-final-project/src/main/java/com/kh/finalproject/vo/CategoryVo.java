package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CategoryVo {
	private int categoryNo;
	private String categoryTheme;
	private Integer categorySuper;
	private String categoryApprove;
	
	private String categorySuperTheme;
}
