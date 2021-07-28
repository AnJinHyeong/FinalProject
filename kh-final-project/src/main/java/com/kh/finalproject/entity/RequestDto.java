package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RequestDto {

	private int requestNo;
	private String requestTitle;
	private String requestContent;
	private Date requestDate;
	private int requestView;
	private int requestLikeCount;
	private int requestReplyCount;
	
	private int requestCategoryNo;
	private int requestMemberNo;
	
}
