package com.kh.finalproject.projectTest;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.vo.ItemListVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class ProjectTest03 {

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		List<ItemListVo> itemList = new ArrayList<>();

		itemList.add(ItemListVo.builder().itemNo(185).itemQuantity(1).build());

		itemList.add(ItemListVo.builder().itemNo(186).itemQuantity(1).build());

		itemList.add(ItemListVo.builder().itemNo(187).itemQuantity(1).build());

		log.info(itemList.toString());
		for (int i = 0; i < itemList.size(); i++) {
			sqlSession.insert("giftItem.insert", itemList.get(i));
		}
	}

}
