package com.kh.finalproject.vo.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class PaySelectedCardInfoVO {
	private String card_bin;						//카드 BIN
	private int install_month;					//할부 개월 수
	private String card_corp_name;			//카드사 정보
	private String interest_free_install;	//무이자 할부 여부(Y/N)
}