package com.kh.finalproject.projectTest;

import java.sql.Clob;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.vo.ProjectProgressVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ClobTest02 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		int projectNo = 127;

		ProjectProgressVo target = sqlSession.selectOne("project.getProjectProgress", projectNo);
		
		log.info("compare = {}", target == null || target.getProjectContent().equals(""));
	}
}
