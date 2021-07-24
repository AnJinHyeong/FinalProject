package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.SponsorDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class SponsorTest03 {

	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void test() {
		SponsorDto target = SponsorDto.builder()
				.sponsorNo(25)
				.memberNo(43)
				.build();
//		log.info(target.toString());
//		log.info(sponsorDao.getSponsor(target).toString());
		memberDao.addPointBySponsorCancel(sponsorDao.getSponsor(target));
	}
	
}
