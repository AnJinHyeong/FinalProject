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
}