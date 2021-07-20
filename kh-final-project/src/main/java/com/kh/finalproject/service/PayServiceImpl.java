package com.kh.finalproject.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.repository.PayDao;
import com.kh.finalproject.vo.pay.PayApprovePrepareVO;
import com.kh.finalproject.vo.pay.PayApproveVO;
import com.kh.finalproject.vo.pay.PayReadyPrepareVO;
import com.kh.finalproject.vo.pay.PayReadyVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PayServiceImpl implements PayService{
@Autowired
private PayDao payDao;

	//사업자 번호, Admin Key는 절대로 변하지 않는다
	public static final String cid = "TC0ONETIME";
	public static final String adminKey = "ad99bb7721838867a4a8d393d717bb65";
	public static final String kakaoAk = "KakaoAK " + adminKey;
	public static final String contentType = "application/x-www-form-urlencoded;charset=utf-8";

	@Override
	public PayReadyVO ready(PayReadyPrepareVO payReadyPrepareVO) throws URISyntaxException {
		
		int payNo = payDao.getSequence();//주문번호 생성
		payReadyPrepareVO.setPartner_order_id(String.valueOf(payNo));
		
		//[1] 요청 도구 생성
		RestTemplate template = new RestTemplate();
		
		//[2] Http Header 생성(ex : 편지봉투)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", kakaoAk);
		headers.add("Content-type", contentType);
		
		//[3] Http Body 생성(ex : 편지내용)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", cid);//가맹점ID(사업자 제휴 시 발급, 테스트용 ID 사용)
		body.add("partner_order_id", payReadyPrepareVO.getPartner_order_id());//판매자 구분 ID
		body.add("partner_user_id", payReadyPrepareVO.getPartner_user_id());//구매자 구분 ID
		body.add("item_name", payReadyPrepareVO.getItem_name());//명세서에 표시될 구매 내역(다건 구매일 경우 ???외 ?건 형식)
		body.add("quantity", String.valueOf(payReadyPrepareVO.getQuantity()));//구매수량
		body.add("total_amount", String.valueOf(payReadyPrepareVO.getTotal_amount()));//총 구매금액
		body.add("tax_free_amount", String.valueOf(payReadyPrepareVO.getTax_free_amount()));//면세금액(없으면 0)
		
		body.add("approval_url", "http://localhost:8080/finalproject/pay/success");//사용자 결제 성공시 신호를 받을 주소
		body.add("cancel_url", "http://localhost:8080/finalproject/pay/cancel");//사용자 결제 취소시 신호를 받을 주소
		body.add("fail_url", "http://localhost:8080/finalproject/pay/fail");//사용자 결제 실패시 신호를 받을 주소
		
		//[4] Http Header / Body 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		//[5] 목적지 주소 작성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
		//[6] 전송
		PayReadyVO readyVO = template.postForObject(uri, entity, PayReadyVO.class);
		log.debug("readyVO = {}", readyVO);
		log.debug("url = {}", readyVO.getNext_redirect_pc_url());
		log.debug("tid = {}", readyVO.getTid());
		
		//DB 등록 작업 수행

		PayDto payDto = PayDto.builder()
												.payNo(Integer.parseInt(payReadyPrepareVO.getPartner_order_id()))
												.payTid(readyVO.getTid())
												.payPrice(payReadyPrepareVO.getTotal_amount())
												.memberNo(Integer.parseInt(payReadyPrepareVO.getPartner_user_id()))
											.build();
		payDao.ready(payDto);
		
		//컨트롤러에서 사용할 수 있도록 추가 데이터를 세팅하여 반환
		readyVO.setPartner_order_id(payReadyPrepareVO.getPartner_order_id());
		readyVO.setPartner_user_id(payReadyPrepareVO.getPartner_user_id());
//		readyVO.setMember_no(payReadyPrepareVO.getMemberNo());
		return readyVO;
	}
	
	@Override
	public PayApproveVO approve(PayApprovePrepareVO payApprovePrepareVO) throws URISyntaxException {
		//[1] 요청 도구 생성
		RestTemplate template = new RestTemplate();
		
		//[2] Http Header 생성(ex : 편지봉투)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", kakaoAk);
		headers.add("Content-type", contentType);
		
		//[3] Http Body 생성(ex : 편지내용)
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", cid);
		body.add("tid", payApprovePrepareVO.getTid());//결제준비 응답정보에 포함된 TID 항목 값
		body.add("partner_order_id", payApprovePrepareVO.getPartner_order_id());//결제준비 요청정보에 포함된 PARTNER_ORDER_ID 항목 값
		body.add("partner_user_id", payApprovePrepareVO.getPartner_user_id());//결제준비 요청정보에 포함된 PARTNER_USER_ID 항목 값
		body.add("pg_token", payApprovePrepareVO.getPg_token());//결제 성공 시 파라미터로 전달되는 PG_TOKEN 항목 값
		
		//[4] Http Header / Body 합성	
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		//[5] 목적지 주소 작성
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
		//[6] 전송
		PayApproveVO approveVO = 
				template.postForObject(uri, entity, PayApproveVO.class);
		
		//[7] DB의 결제정보를 승인으로 변경
		payDao.approve(Integer.parseInt(payApprovePrepareVO.getPartner_user_id()));
		
		return approveVO;
	}

//	@Override
//	public PayReadyVO sequence(PayReadyPrepareVO PayReadyPrepareVO) throws URISyntaxException {
//		return sqlSession.selectOne("member.get, pa");
//		
//	}


//	@Override
//	public KakaoPaySearchVO search(String tid) throws URISyntaxException {
//		//[1] 요청 도구 생성
//		RestTemplate template = new RestTemplate();
//		
//		//[2] Http Header 생성(ex : 편지봉투)
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", kakaoAk);
//		headers.add("Content-type", contentType);
//		
//		//[3] Http Body 생성(ex : 편지내용)
//		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//		body.add("cid", cid);
//		body.add("tid", tid);
//		
//		//[4] Http Header / Body 합성
//		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
//		
//		//[5] 목적지 주소 작성
//		URI uri = new URI("https://kapi.kakao.com/v1/payment/order");
//		
//		//[6] 전송
//		KakaoPaySearchVO searchVO = template.postForObject(uri, entity, KakaoPaySearchVO.class);
//		log.debug("searchVo = {}", searchVO);
//		
//		return searchVO;
//	}
//
//	@Override
//	public KakaoPayCancelVO cancel(KakaoPayCancelPrepareVO prepareVO) throws URISyntaxException {
//		
//		PaymentDto paymentDto = paymentDao.get(prepareVO.getPaymentNo());
//		prepareVO.setTid(paymentDto.getPaymentTid());
//		
//		//[1] 요청 도구 생성
//		RestTemplate template = new RestTemplate();
//		
//		//[2] Http Header 생성(ex : 편지봉투)
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", kakaoAk);
//		headers.add("Content-type", contentType);
//		
//		//[3] Http Body 생성(ex : 편지내용)
//		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//		body.add("cid", cid);
//		body.add("tid", prepareVO.getTid());
//		body.add("cancel_amount", String.valueOf(prepareVO.getCancel_amount()));
//		body.add("cancel_tax_free_amount", String.valueOf(prepareVO.getCancel_tax_free_amount()));
//		
//		//[4] Http Header / Body 합성
//		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
//		
//		//[5] 목적지 주소 작성
//		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
//		
//		//[6] 전송
//		KakaoPayCancelVO cancelVO = 
//				template.postForObject(uri, entity, KakaoPayCancelVO.class);
//		log.debug("cancelVO = {}", cancelVO);
//		
//		//데이터베이스 상태를 취소로 변경하는 코드
//		paymentDao.cancel(prepareVO.getPaymentNo());
//		
//		return cancelVO;
//	}
}