
package com.kh.finalproject.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class AdminMemberVO {
//멤버 조회 데이터
	private String memberId;
	private String memberNick;
	private int memberHavePoint;
	private String memberEmail;
	private String memberGrade;
	private String memberAddress;
	
//Outer할 기준점 데이터
	private int memberNo;
	
//	결제 내역 조회 데이터
	private int payNo;
	private String payTid;
	private int payPrice;
	private String payStatus;
	private Date payDate;

}
