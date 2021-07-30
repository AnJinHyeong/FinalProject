package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.vo.ProjectAmountGiveVo;
import com.kh.finalproject.vo.SponsorListVo;
import com.kh.finalproject.vo.SponsorVo;

public interface SponsorDao {
	// 후원 등록
	void insert(SponsorDto sponsorDto);
	// 프로젝트 후원모금 합
	int currentAmount(int projectNo);
	// 프로젝트 후원자 수
	int currentSponsorMemberCount(int projectNo);
	
	// 내가 후원한 후원 프로젝트 목록/후원금액(진행중)
	List<SponsorVo> sponsorStartedProjectListByMemberNo(int memberNo);
	// 내가 후원한 후원 프로젝트 목록/후원금액(완료)
	List<SponsorVo> sponsorFinishedProjectListByMemberNo(int memberNo);
	// 내가 후원한 후원 프로젝트 목록/후원금액(취소내역 존재)
	List<SponsorVo> sponsorCanceledProjectListByMemberNo(int memberNo);	
	
	// 프로젝트 번호와 회원 번호로 프로젝트에 후원한 금액 파악하기
	int sponsorAmountByProjectNoAndMemberNo(SponsorVo sponsorVo);
	// 프로젝트 번호로 내가 후원한 후원목록 받아오기(날짜형식 string - Vo사용)
	List<SponsorListVo> sponsorListByProjectNo(SponsorDto sponsorDto);
	// 프로젝트 번호로 내가 취소한 후원목록 받아오기(날짜형식 string - Vo사용)
	List<SponsorListVo> sponsorCanceledListByProjectNo(SponsorDto sponsorDto);
	
	// 후원 취소
	boolean sponsorCancel(SponsorDto sponsorDto);
	// 후원객체로 후원정보 가져오기
	SponsorDto getSponsor(SponsorDto sponsorDto);
	// 프로젝트 번호로 후원목록 가져오기
	List<ProjectAmountGiveVo> getSponsorAmountListByProjectNo(int projectNo);
}
