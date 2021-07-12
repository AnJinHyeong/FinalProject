package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.vo.MemberVo;

public interface MemberDao {
	MemberVo idCheck(String memberId);
	MemberVo memberInsert(MemberVo memberVo);
	MemberVo memberNoSequence(MemberVo memberVo);
	MemberDto login(MemberDto memberDto);
	MemberDto logout(MemberDto memberDto);
}
