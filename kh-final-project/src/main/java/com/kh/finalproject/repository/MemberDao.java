package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.entity.SponsorDto;

public interface MemberDao {
	boolean checkId(String memberId);
	void memberInsert(MemberDto memberDto);
	MemberDto login(MemberDto memberDto);
	// 회원 번호를 이용해 회원 정보 조회
	MemberDto getByMemberNo(int memberNo);

	int selectHavePoint(int memberNo);
	List<PayDto>list(int memberNo);

	// 보유 포인트 조회
	int getMemberHavePoint(int memberNo);
	// 포인트 사용, 보유포인트 감소
	void usePoint(SponsorDto sponsorDto);
}
