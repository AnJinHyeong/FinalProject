package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RequestLikeDto {

	private int requestLikeNo;
	private int requestLikeMemberNo;
	private Date requestLikeDate;
	
}
