package com.kh.finalproject.repository;

import com.kh.finalproject.entity.PayDto;

public interface PayDao {
	int getSequence();
	void ready(PayDto payDto);
	boolean approve(PayDto payDto);
	void approve(int payNo);
	boolean plus(PayDto payDto);
//	List<PaymentDto> list(int paymentBuyer);
	PayDto get(int payNo);
//	void cancel(int paymentNo);
}