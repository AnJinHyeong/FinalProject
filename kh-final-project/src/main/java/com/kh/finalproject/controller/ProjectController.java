package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ProjectDao;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@GetMapping("/projectMain")
	public String projectMain() {
		return "project/projectMain";
	}
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/projectMainDefault")
	public String projectMainDefault(){
		return "project/projectMainDefault";
	}
	
	@GetMapping("/projectInsert")
	public String projectInsert(Model model) {
		model.addAttribute("categoryApproveList", categoryDao.approveList());
		return "project/projectInsert";
	}
	
	@Autowired
	private ProjectDao projectDao;
	
	@PostMapping("/projectInsert")
	public String projectInsert(@ModelAttribute ProjectDto projectDto) {
		projectDao.insert(projectDto);
		return "redirect:projectMain";
	}
	
	@GetMapping("/projectMainFunding")
	public String projectFunding() {
		return "project/projectMainFunding";
	}

}
