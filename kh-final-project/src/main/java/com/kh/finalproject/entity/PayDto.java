package com.kh.finalproject.entity;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayDto {
	private int payNo;
	private String payTid;
	private int payPrice;
	private String payStatus;
	private Date payDate;
	//외래키
	private int memberNo;
}