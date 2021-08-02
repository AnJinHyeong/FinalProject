package com.kh.finalproject.vo;

import com.kh.finalproject.entity.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @Builder @AllArgsConstructor
public class MemberVo {
	
	private int memberNo;
	private String newPw;
	private String nowPw;

}
