package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.ProjectDao;

import lombok.extern.slf4j.Slf4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class ProjectTest02 {

	@Autowired
	private ProjectDao projectDao;
	
	@Test
	public void test(){
		int memberNo = 1;
		
		ProjectDto find = projectDao.workingProject(memberNo);
		
		log.info(find.toString());
	}
	
	
}
