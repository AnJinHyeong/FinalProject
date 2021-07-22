package com.kh.finalproject.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@RestController
@RequestMapping("/header")
public class HeaderController {
	
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/memberHavePoint")
	public void point(@RequestParam int memberNo){
		memberDao.selectHavePoint(memberNo);
	}
	
}
