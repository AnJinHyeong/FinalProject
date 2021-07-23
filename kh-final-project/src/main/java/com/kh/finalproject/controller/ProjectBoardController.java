package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.error.SponFailException;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/projectBoard")
@Slf4j
public class ProjectBoardController {
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private GiftDao giftDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SponsorDao sponsorDao;
	
	@GetMapping("/{projectNo}")
	public String projectBoard(
			HttpSession session,
			@PathVariable int projectNo,
			Model model) {
		ProjectDto projectDto = projectDao.getByProjectNo(projectNo);
		model.addAttribute("projectDto", projectDto);
		
		CategoryDto categoryDto = categoryDao.getByNo(projectDto.getCategoryNo());
		model.addAttribute("categoryDto", categoryDto);
		
		String plus7 = projectDao.projectEndDatePlus7(projectNo);
		model.addAttribute("plus7", plus7);
		model.addAttribute("giftList", giftDao.listByProjectNo(projectNo));
		model.addAttribute("giftCount", giftDao.count(projectNo));
		model.addAttribute("giftItemVoList", giftDao.list());
		model.addAttribute("currentAmount", sponsorDao.currentAmount(projectNo));
		model.addAttribute("projectPercent", projectDao.getByProjectNo(projectNo).getProjectPercent());
		model.addAttribute("currentSponsorMemberCount", sponsorDao.currentSponsorMemberCount(projectNo));
		
		return "projectBoard/projectBoard";
	}
	
	@PostMapping("/{projectNo}")
	@Transactional
	public String projectBoard(@PathVariable int projectNo, HttpSession session, @ModelAttribute SponsorDto sponsorDto) {
		int memberNo = (int)session.getAttribute("memberNo");
		sponsorDto.setMemberNo(memberNo);
		sponsorDto.setProjectNo(projectNo);
		
		MemberDto target = memberDao.getByMemberNo(memberNo);
		if(target.getMemberHavePoint() < sponsorDto.getSponsorAmount()) {
			System.out.println("sponfailException111111111111111");
			throw new SponFailException("보유 포인트가 부족합니다.");
		}
		System.out.println("sponfailException333333333333333333333");
		sponsorDao.insert(sponsorDto);
		memberDao.usePoint(sponsorDto);
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		int percent = currentAmount * 100 / targetAmount;
		
		log.info(String.valueOf(percent));
		
		projectDao.setPercent(ProjectDto.builder()
				.projectNo(projectNo)
				.projectPercent(percent)
				.build());
		
		return "redirect:/projectBoard/" + projectNo;
	}
	
}
