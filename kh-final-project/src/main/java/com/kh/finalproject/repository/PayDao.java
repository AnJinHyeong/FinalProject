package com.kh.finalproject.repository;

import com.kh.finalproject.entity.PayDto;

public interface PayDao {
	int getSequence();
	void ready(PayDto payDto);
	void approve(int payNo);
//	List<PaymentDto> list(int paymentBuyer);
//	PaymentDto get(int paymentNo);
//	void cancel(int paymentNo);
}