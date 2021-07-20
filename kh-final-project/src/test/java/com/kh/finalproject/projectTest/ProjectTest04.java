package com.kh.finalproject.projectTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.repository.ProjectDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ProjectTest04 {

	@Autowired
	private ProjectDao projectDao;

	@Test
	public void test() {
		int projectNo = 32;
		String projectColumn = "project_no";
//		boolean result = projectDao.projectColumnIsNull(projectNo, projectColumn);
//		if(result) {
			log.info("null입니다");
//		}
	}
	
}
