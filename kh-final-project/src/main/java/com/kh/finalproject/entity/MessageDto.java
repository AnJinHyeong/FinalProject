package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MessageDto {
	
	private int msgNo;
	private int senderNo;
	private String msgTitle;
	private String msgContent;
	private Date msgDate;
	private int receiverNo;

}
