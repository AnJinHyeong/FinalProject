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

import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.service.PointService;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {

	@Autowired
	private SponsorDao sponsorDao;
	
	@GetMapping("/sponsorList")
	public String sponsorList(HttpSession session, Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		model.addAttribute("sponsorStartedProjectListByMemberNo", sponsorDao.sponsorStartedProjectListByMemberNo(memberNo));
		return "sponsor/sponsorList";
	}
	
	@Autowired
	private PointService pointService;
	
	@PostMapping("/sponsorCancel")
	@Transactional
	public String sponsorCancel(HttpSession session, @RequestParam int sponsorNo) {
		
		pointService.cancelSponsor(session, sponsorNo);
		
		return "redirect:sponsorList";
	}
	
	
}
