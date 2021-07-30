package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SearchVo {
	private String keyword;
	
	private int projectOrder;
	private String projectOrderString;
	
	private int projectState;
	private String projectStateString;
}
