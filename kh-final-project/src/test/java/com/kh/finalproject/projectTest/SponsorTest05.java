package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.SponsorVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class SponsorTest05 {

	@Autowired
	private SponsorDao sponsorDao;
	
	@Test
	public void test() {
		int currentMemberNo = 43;
		
		int projectNo = 36;
		
		SponsorVo target = SponsorVo.builder().memberNo(currentMemberNo).projectNo(projectNo).build();
		
		log.info(target.toString());
		
		Integer sumSponsorAmountByOne = sponsorDao.sponsorAmountByProjectNoAndMemberNo(target);
		
		log.info(String.valueOf(sumSponsorAmountByOne));
	}
	
}
