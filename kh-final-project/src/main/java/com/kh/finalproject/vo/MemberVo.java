package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @Builder @AllArgsConstructor
public class MemberVo{
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberEmail;
	private String memberIntroduce;
}
    