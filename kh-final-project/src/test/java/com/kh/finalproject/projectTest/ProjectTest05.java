package com.kh.finalproject.projectTest;

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
public class ProjectTest05 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		int projectNo = 127;
		
		ProjectProgressVo target = sqlSession.selectOne("project.getProjectProgress", projectNo);
		
		boolean default1 = target.getCategoryNo() != null;
		boolean default2 = target.getProjectTitle() != null && target.getProjectTitle() != "";
		boolean default3 = target.getProjectSummary() != null && target.getProjectSummary() != "";
		boolean default4 = false;
		if(target.getIFCount() != null) {
			default4 = target.getIFCount() > 0;
		}
	
		boolean funding1 = target.getProjectTargetAmount() != null && target.getProjectTargetAmount() != 0;
		boolean funding2 = target.getProjectStartDate() != null && target.getProjectEndDate() != null;
	
		boolean gift = false;
		if(target.getGCount() != null) {
			gift = target.getGCount() > 0;
		}
		boolean item = false;
		if(target.getICount() != null) {
			item = target.getICount() > 0;
		}
		
		boolean story = target.getProjectContent() != null && !target.getProjectContent().equals("");
		
		boolean member1 = target.getMemberInfoNick() != null && target.getMemberInfoNick() != "";
		boolean member2 = target.getMemberInfoContent() != null && target.getMemberInfoContent() != "";

		int result = 0;
		if(default1) result += 5;
		if(default2) result += 5;
		if(default3) result += 5;
		if(default4) result += 5;
		
		if(funding1) result += 10;
		if(funding2) result += 10;
		
		if(gift) result += 10;
		if(item) result += 10;
		
		if(story) result += 20;
		
		result += 6;
		if(member1) result += 7;
		if(member2) result += 7;
		
		log.info(String.valueOf(result));
	}
	
}
