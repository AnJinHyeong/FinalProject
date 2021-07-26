package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	MemberDto idCheck(String memberId);
	void memberInsert(MemberDto memberDto);
	MemberDto login(MemberDto memberDto);
	//회원 번호를 이용해 회원 정보 조회
	MemberDto getByMemberNo(int memberNo);
	MemberDto getByMemberEmail(String email);
	
	void updatePw(MemberDto memberDto);
	boolean updateEmail(MemberDto memberDto);
	boolean changePassword(MemberDto memberDto);
	boolean updateIntro(MemberDto memberDto);
}
