package com.kh.finalproject.vo.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayAmountVO {
	private int total;				//전체 결제 금액
	private int tax_free;		//비과세 금액
	private int vat;				//부가세 금액
	private int point;			//사용한 포인트 금액
	private int discount;		//할인 금액
}