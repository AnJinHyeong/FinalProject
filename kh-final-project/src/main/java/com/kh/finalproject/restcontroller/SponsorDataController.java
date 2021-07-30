package com.kh.finalproject.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.SponsorVo;

@RequestMapping("/sponsor/data")
@RestController
public class SponsorDataController {

	@Autowired
	private SponsorDao sponsorDao;

	@PostMapping("/sponsorVoList/{index}")
	public List<SponsorVo> approveCheck(HttpSession session, @PathVariable int index) {
		int memberNo = (int)session.getAttribute("memberNo");
		if(index == 0) {
			return sponsorDao.sponsorStartedProjectListByMemberNo(memberNo);
		}
		else if(index == 1){
			return sponsorDao.sponsorFinishedProjectListByMemberNo(memberNo);
		}
		else {
			return sponsorDao.sponsorCanceledProjectListByMemberNo(memberNo);
		}
	}
	
}
