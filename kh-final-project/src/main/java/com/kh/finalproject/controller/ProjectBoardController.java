package com.kh.finalproject.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectCommunityDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.ProjectReportDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.error.PercentCalcFailException;
import com.kh.finalproject.error.SponFailException;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectCommunityDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.ProjectReportDao;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.service.PointService;

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
	
	@GetMapping("/{projectNo}/projectBoardCommunity")
	public String projectBoardCommunity(
			HttpSession session,
			@PathVariable int projectNo,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		MemberDto memberDto = memberDao.getByMemberNo(memberNo);
		model.addAttribute("memberDto", memberDto);
		
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
		
		List<ProjectCommunityDto> communityList = projectCommunityDao.listByProjectNo2(projectNo);
		model.addAttribute("communityList", communityList);
		
		return "projectBoard/projectBoardCommunity";
	}
	
	@Autowired
	private ProjectCommunityDao projectCommunityDao;
	
	@PostMapping("/{projectNo}/projectBoardCommunity")
	public String projectBoardCommunity(
			@PathVariable int projectNo,
			HttpSession session,
			@RequestParam String projectCommunityContent) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectCommunityDto find = ProjectCommunityDto.builder()
				.projectCommunityContent(projectCommunityContent)
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		projectCommunityDao.insert(find);
		
		return "redirect:projectBoardCommunity";
	}
	
	@GetMapping("/{projectNo}/projectBoardCommunityDelete")
	public String projectBoardCommunityDelete(
			HttpSession session,
			@RequestParam int projectCommunityNo,
			@PathVariable int projectNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectCommunityDto projectCommunityDto = ProjectCommunityDto.builder()
				.memberNo(memberNo)
				.projectCommunityNo(projectCommunityNo)
				.build();
		
		projectCommunityDao.delete(projectCommunityDto);
		
		return "redirect:projectBoardCommunity";
	}
	
	@Autowired
	private PointService pointService;
	
	@PostMapping("/{projectNo}")
	public String projectBoard(@PathVariable int projectNo, HttpSession session, @ModelAttribute SponsorDto sponsorDto) {
		
		pointService.usePoint(projectNo, session, sponsorDto);
		
		return "redirect:/projectBoard/" + projectNo;
	}
	
	@Autowired
	private ProjectReportDao projectReportDao;
	
	@PostMapping("/projectReport")
	public String projectReport(
			HttpSession session,
			@RequestParam int projectNo,
			@RequestParam String reportContent) {
		int memberNo = (int)session.getAttribute("memberNo");
		
		ProjectReportDto projectReportDto = ProjectReportDto.builder()
				.reportContent(reportContent)
				.reportMemberNo(memberNo)
				.reportProjectNo(projectNo)
				.build();
		
		projectReportDao.insert(projectReportDto);
		
		return "redirect:/projectBoard/"+projectNo;
	}
	
}
