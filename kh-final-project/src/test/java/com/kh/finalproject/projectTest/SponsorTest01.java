package com.kh.finalproject.projectTest;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.vo.SponsorVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class SponsorTest01 {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		SponsorVo sponsorVo = new SponsorVo();
		
		sponsorVo.setMemberNo(43);
		sponsorVo.setProjectNo(38);
		
		int result = sqlSession.selectOne("sponsor.sponsorAmountByProjectNoAndMemberNo", sponsorVo);
		
		log.info(String.valueOf(result));
	}
	
}
