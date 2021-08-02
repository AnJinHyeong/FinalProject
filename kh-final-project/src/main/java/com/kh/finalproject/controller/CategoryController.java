package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.vo.CategoryVo;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/categoryDelete")
	public String categoryDelete(@RequestParam int categoryNo) {
		categoryDao.deleteCategoryByCategoryNo(categoryNo);
		return "redirect:/admin/adminCategory";
	}
	
	@GetMapping("/categorySetApproveY")
	public String categorySetAppoveY(@RequestParam int categoryNo) {
		categoryDao.categorySetApproveY(categoryNo);
		return "redirect:/admin/adminCategory";
	}
	
	@PostMapping("/categoryInsert")
	public String categoryInsert(@ModelAttribute CategoryVo categoryVo) {
		categoryDao.categoryInsert(categoryVo);
		return "redirect:/admin/adminCategory";
	}
}
