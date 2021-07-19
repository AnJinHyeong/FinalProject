package com.kh.finalproject.vo.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *	이 클래스는 카카오페이의 결제요청에 따른 응답정보를 저장하기 위한 VO이다. 
 */
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class PayReadyVO {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
	
	private String partner_order_id;
	private String partner_user_id;
	
	private int member_no;
}