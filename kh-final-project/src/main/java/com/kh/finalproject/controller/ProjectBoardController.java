package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.ProjectDao;

@Controller
@RequestMapping("/projectBoard")
public class ProjectBoardController {
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private GiftDao giftDao;
	
	@GetMapping("/{projectNo}")
	public String projectBoard(
			HttpSession session,
			@PathVariable int projectNo,
			Model model) {
		ProjectDto projectDto = projectDao.getByProjectNo(projectNo);
		model.addAttribute("projectDto", projectDto);
		
		CategoryDto categoryDto = categoryDao.getByNo(projectDto.getCategoryNo());
		model.addAttribute("categoryDto", categoryDto);
		
		String plus7 = projectDao.projectEndDatePlus7(projectNo);
		model.addAttribute("plus7", plus7);
		model.addAttribute("giftList", giftDao.listByProjectNo(projectNo));
		model.addAttribute("giftCount", giftDao.count(projectNo));
		
		return "projectBoard/projectBoard";
	}
	
}
