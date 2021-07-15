package com.kh.finalproject.entity;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PaymentDto {
	private int paymentNo;
	private String paymentTid;
	private int paymentBuyer;
	private int paymentProduct;
	private String paymentStatus;
	private Date paymentTime;
}