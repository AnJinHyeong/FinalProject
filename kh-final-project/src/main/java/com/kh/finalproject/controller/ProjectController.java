package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.vo.ProjectCategoryVo;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@GetMapping("/projectInsert")
	public String projectInsert(Model model) {
		model.addAttribute("categoryApproveList", categoryDao.approveList());
		return "project/projectInsert";
	}
	
	@PostMapping("/projectInsert")
	public String projectInsert(@ModelAttribute ProjectCategoryVo projectCategoryVo) {
		String categoryTheme = projectCategoryVo.getCategoryTheme();
		int categoryNo;
		if(categoryDao.isExist(categoryTheme)) {
			categoryNo = categoryDao.get(categoryTheme).getCategoryNo();
		}
		else {
			int sequence = categoryDao.getSequence();
			categoryNo = sequence;
			categoryDao.insert(CategoryDto.builder()
								.categoryNo(sequence)
								.categoryTheme(categoryTheme)
									.build());
		}
		projectCategoryVo.setCategoryNo(categoryNo);
		projectDao.insert(projectCategoryVo);
		return "redirect:projectMain";
	}
	
	@GetMapping("/projectMain")
	public String projectMain(
			@ModelAttribute ProjectDto projectDto,
			@RequestParam int projectNo,
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		projectDto = ProjectDto.builder()
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		ProjectDto find = projectDao.listOne(projectDto);
		model.addAttribute("projectDto", find);
		return "project/projectMain";
	}
	
	
	@GetMapping("/projectMainDefault")
	public String projectMainDefault(
			@ModelAttribute ProjectDto projectDto,
			@RequestParam int projectNo,
			HttpSession session,
			Model model){
		int memberNo = (int)session.getAttribute("memberNo");
		projectDto = ProjectDto.builder()
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		ProjectDto find = projectDao.listOne(projectDto);
		model.addAttribute("projectDto", find);
		return "project/projectMainDefault";
	}
	
	@GetMapping("/projectMainFunding")
	public String projectFunding() {
		return "project/projectMainFunding";
	}
	
	@GetMapping("/projectMainGift")
	public String projectMainGift() {
		return "project/projectMainGift";
	}
	
	@GetMapping("/projectMainGiftItem")
	public String projectMainGiftItem() {
		return "project/projectMainGiftItem";
	}

}
