package com.kh.finalproject.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.MemberDao;

import com.kh.finalproject.service.EmailService;

import com.kh.finalproject.repository.ProjectDao;

import com.kh.finalproject.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	@RequestMapping("/myPage")
	public String myPage() {
		return "member/myPage";
	}
	
  
	@PostMapping(value = "/memberInsert")
	public String memberInsert(@ModelAttribute MemberVo memberVo) {
	memberDao.memberInsert(memberVo);
	return "member/joinSuccess";
	
	}
	 
	@GetMapping("/login")
	public String memberInsert() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto find = memberDao.login(memberDto);
		if(find != null) {
			session.setAttribute("memberNo", find.getMemberNo());
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
			session.removeAttribute("memberNo");
			
			return "redirect:/";
	}
	
	@Autowired
	private ProjectDao projectDao;
	
	@GetMapping("/myProject")
	public String myProject(
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		List<ProjectDto> find = projectDao.list(memberNo);
		model.addAttribute("projectDto", find);
		
		return "member/myProject";
	}
	
	
		

}

