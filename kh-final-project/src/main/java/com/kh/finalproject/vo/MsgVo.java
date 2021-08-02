package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MsgVo {

	private int msgNo;
	private int senderNo;
	private String msgTitle;
	private String msgContent;
	private String msgDate;
	private int receiverNo;
	private String memberId;
	private String memberId2;


	
	private String senderNick;
	private String receiverNick;
	
	private String keyword;

}
