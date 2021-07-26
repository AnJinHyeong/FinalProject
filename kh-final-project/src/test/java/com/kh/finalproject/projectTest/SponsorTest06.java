package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.error.SponFailException;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class SponsorTest06 {

	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Test
	public void test() {
		SponsorDto sponsorDto = new SponsorDto();
		int memberNo = 36;
		int projectNo = 83;
		int sponsorAmount = 0;
		sponsorDto.setMemberNo(memberNo);
		sponsorDto.setProjectNo(projectNo);
		sponsorDto.setSponsorAmount(sponsorAmount);
		
		MemberDto target = memberDao.getByMemberNo(memberNo);
		log.info(target.toString());
		
		if(target.getMemberHavePoint() < sponsorDto.getSponsorAmount()) {
			log.info("보유 포인트 부족");
		}
		else {
			log.info("충분");
		}
		sponsorDao.insert(sponsorDto);
		memberDao.usePoint(sponsorDto);
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		log.info(String.valueOf(currentAmount));
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		log.info(String.valueOf(targetAmount));
//		int percent = currentAmount * 100 / targetAmount;
		
	}
	
}
