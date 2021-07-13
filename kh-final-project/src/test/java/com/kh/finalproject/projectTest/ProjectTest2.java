package com.kh.finalproject.projectTest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ProjectDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class ProjectTest2 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Test
	public void test() {
		ProjectDto projectDto = ProjectDto.builder()
				.projectNo(24)
				.memberNo(1)
				.build();
		ProjectDto find = projectDao.get(projectDto);
		
		log.info(find.toString());;
		
		List<CategoryDto> category = categoryDao.userCustomList(find.getCategoryNo());
		
		
		log.info(category.toString());
		
	}
	
	
	
}
