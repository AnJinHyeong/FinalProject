package com.kh.finalproject.restcontroller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
//github.com/AnJinHyeong/FinalProject.git
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@RestController
public class HeaderController {
	
	@Autowired
	MemberDao memberDao;
	
	@PostMapping("/getMemberHavePoint")
	public Integer getMemberHavePoint(HttpSession session){
		Integer memberNo = (Integer)session.getAttribute("memberNo");
		if(memberNo == null) {
			return null;
		}
		return memberDao.getMemberHavePoint(memberNo); 
	}
}
