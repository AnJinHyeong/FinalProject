package com.kh.finalproject.restcontroller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.CategoryDao;

@RequestMapping("/project/data")
@RestController
public class ProjectDataController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	@PostMapping("/categoryApproveCheck")
	public String approveCheck(@RequestParam int categoryNo) {
		String result = categoryDao.approveCheck(categoryNo);
		return result;
	}
	
}
