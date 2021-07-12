package com.kh.finalproject.repository;

import com.kh.finalproject.vo.member.MemberVo;

public interface MemberDao {
	MemberVo idCheck(String memberId);
	MemberVo memberInsert(MemberVo memberVo);
	MemberVo memberNoSequence(MemberVo memberVo);
}
