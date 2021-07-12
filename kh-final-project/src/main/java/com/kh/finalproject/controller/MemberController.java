package com.kh.finalproject.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.vo.member.MemberVo;

@Controller
public class MemberController {

	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@Autowired
	private MemberDao memberDao; 

	@PostMapping(value = "/memberInsert")
	public String memberInsert(@ModelAttribute MemberVo memberVo) {
	memberDao.memberInsert(memberVo);
	return "member/joinSuccess";
	
	}

	 

}
