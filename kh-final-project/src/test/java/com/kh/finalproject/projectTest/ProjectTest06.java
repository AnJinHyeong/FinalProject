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

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ProjectTest06 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		int projectNo = 123;
		List<Integer> fileNoList = new ArrayList<>();
		fileNoList.add(1);
		fileNoList.add(2);
		fileNoList.add(3);
		Map<String, Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("fileNoList", fileNoList);
		sqlSession.delete("imageFile.deleteProjectStoryNotCurrentImage", map);
	}
	
}
