package com.kh.finalproject.projectTest;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.SponsorDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ProjectTest08 {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private SponsorDao sponsorDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Test
	public void test() {
		int projectNo = 36;
		
		int currentAmount = sponsorDao.currentAmount(projectNo);
		int targetAmount = projectDao.getByProjectNo(projectNo).getProjectTargetAmount();
		int percent = currentAmount * 100 / targetAmount;
		
		log.info(String.valueOf(currentAmount));
		
		log.info(String.valueOf(targetAmount));
		
		log.info(String.valueOf(currentAmount / targetAmount));
		
		log.info(String.valueOf(percent));
	}
	
}
