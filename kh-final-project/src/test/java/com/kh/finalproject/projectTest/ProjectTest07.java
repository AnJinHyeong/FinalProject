package com.kh.finalproject.projectTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.ProjectDto;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ProjectTest07 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectNo(36);
		projectDto.setProjectPercent(10);
		
		sqlSession.update("project.setPercent", projectDto);
	}
	
}
