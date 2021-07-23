package com.kh.finalproject.error;

//사용자가 정의한 "결제예외" 클래스
//public class PaymentException extends Exception{
public class SponFailException extends RuntimeException{//실행중 예외는 따로 throws를 적지 않아도 처리가 가능(체킹익셉션)
	public SponFailException(String message) {
		super(message);
	}
}
