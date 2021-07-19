package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	MemberDto idCheck(String memberId);
	void memberInsert(MemberDto memberDto);
	MemberDto login(MemberDto memberDto);
}
