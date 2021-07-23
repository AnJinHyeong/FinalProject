package com.kh.finalproject.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@RestController
@RequestMapping("/head")
public class JoinCheckController {
	
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/id")
	public String checkId(@RequestParam String memberId){
		if(memberDao.checkId(memberId)) return "N";
			else return "Y";
	}
	
}
