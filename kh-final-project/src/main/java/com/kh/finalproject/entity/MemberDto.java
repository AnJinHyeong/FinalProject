package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @Builder @AllArgsConstructor
public class MemberDto {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private int memberHavePoint;
	private int memberUsePoint;
	private String email;
	private String memberIntroduce;
	private String memberGrade;
	private String memberAddress;
}
   