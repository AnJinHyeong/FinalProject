package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RequestReplyDto {

	private int requestReplyPkNo;
	private int requestReplyNo;
	private int requestReplyMemberNo;
	private String requestReplyContent;
	private Date requestReplyDate;
	
}
