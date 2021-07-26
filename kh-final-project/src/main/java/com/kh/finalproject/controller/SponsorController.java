package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {

	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@GetMapping("/sponsorList")
	public String sponsorList(HttpSession session, Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		model.addAttribute("sponsorStartedProjectListByMemberNo", sponsorDao.sponsorStartedProjectListByMemberNo(memberNo));
		return "sponsor/sponsorList";
	}
	
	@PostMapping("/sponsorCancel")
	@Transactional
	public String sponsorCancel(HttpSession session, @RequestParam int sponsorNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		SponsorDto target = SponsorDto.builder()
				.sponsorNo(sponsorNo)
				.memberNo(memberNo)
				.build();
		sponsorDao.sponsorCancel(target);
		memberDao.addPointBySponsorCancel(sponsorDao.getSponsor(target));
		
		int projectNo = sponsorDao.getSponsor(target).getProjectNo();
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		int percent = currentAmount * 100 / targetAmount;
		
		projectDao.setPercent(ProjectDto.builder()
				.projectNo(projectNo)
				.projectPercent(percent)
				.build());
		
		return "redirect:sponsorList";
	}
	
}
