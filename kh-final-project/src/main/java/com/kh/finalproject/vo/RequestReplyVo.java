package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RequestReplyVo {

	private int requestReplyPkNo;
	private int requestReplyNo;
	private int requestReplyMemberNo;
	private String requestReplyContent;
	private Date requestReplyDate;
	private int requestLikeCount;
	private int requestReplyCount;

	private String memberNick;
	
}
