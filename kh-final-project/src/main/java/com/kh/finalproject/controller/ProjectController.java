package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.vo.ProjectCategoryVo;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@GetMapping("/{projectNo}/projectMain")
	public String projectMain(@PathVariable int projectNo) {
		return "project/projectMain";
	}
	
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(@PathVariable int projectNo){
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
	public String projectInsert(@ModelAttribute ProjectCategoryVo projectCategoryVo, Model model) {
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
		int projectNo = projectDao.sequence();
		projectCategoryVo.setProjectNo(projectNo);
		projectDao.insertBySequence(projectCategoryVo);
		return "redirect:" + projectNo + "/projectMain/";
	}
	
	@GetMapping("/{projectNo}/projectMainFunding")
	public String projectFunding(@PathVariable int projectNo) {
		return "project/projectMainFunding";
	}
	
	@GetMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(@PathVariable int projectNo) {
		return "project/projectMainGift";
	}
	
	@GetMapping("/{projectNo}/projectMainGiftItem")
	public String projectMainGiftItem(@PathVariable int projectNo, Model model) {
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
		return "project/projectMainGiftItem";
	}
	
	@Autowired
	private ItemDao itemDao;
	
	@PostMapping("/{projectNo}/projectMainGiftItem")
	public String projectMainGiftItem(@ModelAttribute ItemDto itemDto, @PathVariable int projectNo) {
		itemDao.insert(itemDto);
		return "redirect:projectMainGiftItem";
	}

}
