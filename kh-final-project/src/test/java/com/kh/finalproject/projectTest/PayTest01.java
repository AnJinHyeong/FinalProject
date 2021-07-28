package com.kh.finalproject.projectTest;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.repository.PayDao;
import com.kh.finalproject.vo.Criteria;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class PayTest01 {
	
	@Autowired
	private PayDao payDao;
	
	@Test
	public void test() {
		int memberNo = 92;
		
		Criteria cri = new Criteria();
		
		log.info(payDao.payList(memberNo, cri).toString());
		
		
	}
}
