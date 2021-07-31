package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RequestAdminSearchKeywordVo {

	private String searchType;
	private String requestOrderBy;
	private String keyword;
	
}
