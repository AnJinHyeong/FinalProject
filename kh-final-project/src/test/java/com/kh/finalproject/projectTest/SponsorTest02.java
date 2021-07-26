package com.kh.finalproject.projectTest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.SponsorDao;
import com.kh.finalproject.vo.SponsorListVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class SponsorTest02 {

	@Autowired
	private SponsorDao sponsorDao;
	
	@Test
	public void test() {
			int memberNo = 43;
			int projectNo = 36;
			List<SponsorListVo> sponsorList = sponsorDao.sponsorListByProjectNo(SponsorDto.builder()
												.projectNo(projectNo)
												.memberNo(memberNo)
												.build());
			log.info(sponsorList.toString());
	}
	
}
