package com.kh.finalproject.projectTest;

import org.apache.ibatis.session.SqlSession;
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
public class ProjectTest01 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Test
	public void test() {
		ProjectDto projectDto = ProjectDto.builder()
				.projectNo(1)
				.memberNo(1)
				.build();
		ProjectDto find = projectDao.get(projectDto);
		
		log.info(find.toString());
	}
	
	
	
}
