package com.kh.finalproject.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@RestController
@RequestMapping("/header")
public class HeaderController {
	
	@Autowired
	MemberDao memberDao;
	
	@PostMapping("/getMemberHavePoint")
	public int getMemberHavePoint(HttpSession session){
		int memberNo = (int)session.getAttribute("memberNo");
		return memberDao.getMemberHavePoint(memberNo); 
	}
	
}
