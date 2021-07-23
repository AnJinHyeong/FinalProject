package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayDto;

public interface MemberDao {
	boolean checkId(String memberId);
	void memberInsert(MemberDto memberDto);
	MemberDto login(MemberDto memberDto);
	//회원 번호를 이용해 회원 정보 조회
	MemberDto getByMemberNo(int memberNo);
	int selectHavePoint(int memberNo);
	List<PayDto>list(int memberNo);
}
