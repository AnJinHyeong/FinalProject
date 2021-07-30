package com.kh.finalproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.error.PercentCalcFailException;
import com.kh.finalproject.error.SponFailException;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.ProjectAmountGiveVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PointServiceImpl implements PointService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Override
	@Transactional
	public void usePoint(int projectNo, HttpSession session, SponsorDto sponsorDto) {
		int memberNo = (int)session.getAttribute("memberNo");
		sponsorDto.setMemberNo(memberNo);
		sponsorDto.setProjectNo(projectNo);
		
		MemberDto target = memberDao.getByMemberNo(memberNo);
		if(target.getMemberHavePoint() < sponsorDto.getSponsorAmount()) {
			throw new SponFailException("후원 프로젝트 번호:" + projectNo + ", 보유 포인트가 부족합니다.");
		}
		sponsorDao.insert(sponsorDto);
		memberDao.usePoint(sponsorDto);
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		if(targetAmount == 0) {
			throw new PercentCalcFailException("후원 프로젝트 번호:" + projectNo + ", 목표금액이 정해지지 않았습니다.");
		}
		int percent = currentAmount * 100 / targetAmount;
		
		projectDao.setPercent(ProjectDto.builder()
				.projectNo(projectNo)
				.projectPercent(percent)
				.build());
	}

	@Override
	@Transactional
	public void cancelSponsor(HttpSession session, int sponsorNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		SponsorDto target = SponsorDto.builder()
				.sponsorNo(sponsorNo)
				.memberNo(memberNo)
				.build();
		sponsorDao.sponsorCancel(target);
		memberDao.addPoint(sponsorDao.getSponsor(target));
		
		int projectNo = sponsorDao.getSponsor(target).getProjectNo();
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		int percent = currentAmount * 100 / targetAmount;
		
		projectDao.setPercent(ProjectDto.builder()
				.projectNo(projectNo)
				.projectPercent(percent)
				.build());
	}

	@Override
	@Transactional
	public void finishedProjectGiveAmount() {
		for(ProjectAmountGiveVo projectAmountGiveVo : projectDao.getProjectAmountGiveVoList()) {
			int projectNo = projectAmountGiveVo.getProjectNo();
			if(projectAmountGiveVo.getProjectPercent() < 100) {
				// 프로젝트 달성도 100% 미만 후원자들에게 포인트 지급
				for(ProjectAmountGiveVo projectAmountGiveVo2 : sponsorDao.getSponsorAmountListByProjectNo(projectNo)) {
					memberDao.addPoint(SponsorDto.builder()
							.memberNo(projectAmountGiveVo2.getSponsorMemberNo())
							.sponsorAmount(projectAmountGiveVo2.getSponsorAmount())
							.build());
				}
				projectDao.setProjectAmountGiveY(projectAmountGiveVo.getProjectNo());
			}
			else {
				// 프로젝트 달성도 100% 이상 제작자에게 포인트 지급
				memberDao.addPoint(SponsorDto.builder()
							.memberNo(projectAmountGiveVo.getMemberNo())
							.sponsorAmount(sponsorDao.currentAmount(projectNo))
							.build());
				projectDao.setProjectAmountGiveY(projectAmountGiveVo.getProjectNo());
			}
		}
	}
	
	public void test() {
		log.debug("포인트 지급이 완료되었습니다. test");
	}
	
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void autoGiveAmountByFinishedProject() {
//		finishedProjectGiveAmount();
		test();
	}

}
