package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.CategoryDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/projectInsert")
	public String projectInsert(Model model) {
//		model.addAttribute("categoryList", categoryDao.list());
		return "project/projectInsert";
	}
	
}
