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
	private Date msgDate;
	private int receiverNo;

}
