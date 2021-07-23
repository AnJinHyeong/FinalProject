package com.kh.finalproject.vo.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayApprovePrepareVO {
	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	private String pg_token;
	
//	기존 포인트 + 충전 포인트 하기위한 충전 값
	private String total_amount;
}