package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.vo.Criteria;

public interface PayDao {
	int getSequence();
	
	/* 결제 전 데이터를 인서트 */
	void ready(PayDto payDto);
	
	/* 결제완료 데이터로 업데이트 */
	void approve(int payNo);
	
	/* 포인트 더하기 */
	boolean plus(PayDto payDto);
	
	/* 결제 목록 조회 */
	List<PayDto> payList(int memberNo, Criteria cri);
	
	/* 결제 목록 조회 개수 */
	int listCount(int memberNo);
	
	PayDto get(int payNo);
}