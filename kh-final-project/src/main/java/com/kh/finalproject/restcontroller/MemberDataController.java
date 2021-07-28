package com.kh.finalproject.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;


@RequestMapping("/member")
@RestController
public class MemberDataController {
	
	@Autowired
	private MemberDao memberDao;
	
	@PostMapping("/memberSelect")
	public MemberDto memberSelect(
			HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		
		MemberDto memberDto = memberDao.getByMemberNo(memberNo);
		return memberDto;
	}
	
	
}
