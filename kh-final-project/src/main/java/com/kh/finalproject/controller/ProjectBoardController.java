package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectCommunityDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectCommunityDao;
import com.kh.finalproject.repository.ProjectDao;

@Controller
@RequestMapping("/projectBoard")
public class ProjectBoardController {
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private GiftDao giftDao;
	
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
		
		return "projectBoard/projectBoard";
	}
	
	@Autowired
	private MemberDao memberDao;
	
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
	
	
	
	
}
