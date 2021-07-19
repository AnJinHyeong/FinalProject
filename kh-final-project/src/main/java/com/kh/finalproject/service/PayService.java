package com.kh.finalproject.service;

import java.net.URISyntaxException;

import com.kh.finalproject.vo.pay.PayApprovePrepareVO;
import com.kh.finalproject.vo.pay.PayApproveVO;
import com.kh.finalproject.vo.pay.PayReadyPrepareVO;
import com.kh.finalproject.vo.pay.PayReadyVO;

public interface PayService {
	//시퀀스 생성
	
	//결제 준비 요청
	PayReadyVO ready(PayReadyPrepareVO PayReadyPrepareVO) throws URISyntaxException;
	//결제 승인 요청
	PayApproveVO approve(PayApprovePrepareVO PayApprovePrepareVO) throws URISyntaxException;
	
//	PayReadyVO sequence(PayReadyPrepareVO PayReadyPrepareVO) throws URISyntaxException;
	
//	//결제 조회 기능
//	PaySearchVO search(String tid) throws URISyntaxException;
//	//결제 취소 기능 
//	PayCancelVO cancel(PayCancelPrepareVO prepareVO) throws URISyntaxException;
}