package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.repository.CategoryDao;

@RequestMapping("/category/data")
@RestController
public class CategoryDataController {
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	@PostMapping("/categoryApproveCheck")
	public String approveCheck(@RequestParam int categoryNo) {
		String result = categoryDao.approveCheck(categoryNo);
		return result;
	}
	
	@PostMapping("/userCustomList")
	public List<CategoryDto> userCustomList(@RequestParam int categoryNo) {
		List<CategoryDto> userCustomList = categoryDao.userCustomList(categoryNo);
		return userCustomList;
	}
	
	
	@PostMapping("/childCategory")
	public List<CategoryDto> childCategory(@RequestParam int categoryNo) {
		List<CategoryDto> childCategory = categoryDao.childCategoryList(categoryNo);
		return childCategory;
	}

}
	

