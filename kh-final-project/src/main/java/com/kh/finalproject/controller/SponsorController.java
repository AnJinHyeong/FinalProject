package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.SponsorDao;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {

	@Autowired
	private SponsorDao sponsorDao;
	
	@GetMapping("sponsorList")
	public String sponsorList(HttpSession session, Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		model.addAttribute("sponsorProjectListByMemberNo", sponsorDao.sponsorProjectListByMemberNo(memberNo));
		return "sponsor/sponsorList";
	}
	
}
