package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.vo.SponsorVo;

public interface SponsorDao {
	// 후원 등록
	void insert(SponsorDto sponsorDto);
	// 프로젝트 후원모금 합
	int currentAmount(int projectNo);
	// 프로젝트 후원자 수
	int currentSponsorMemberCount(int projectNo);
	// 내가 후원한 후원 프로젝트 목록/후원금액
	List<SponsorVo> sponsorProjectListByMemberNo(int memberNo);
	// 프로젝트 번호와 회원 번호로 프로젝트에 후원한 금액 파악하기
	int sponsorAmountByProjectNoAndMemberNo(SponsorVo sponsorVo);
}
