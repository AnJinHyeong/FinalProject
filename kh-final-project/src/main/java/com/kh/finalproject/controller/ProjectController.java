package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

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
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.ImageDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.ImageDao;
import com.kh.finalproject.vo.ProjectCategoryVo;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProjectDao projectDao;

	
	@GetMapping("/projectInsert")
	public String projectInsert(
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectDto projectDto = projectDao.workingProject(memberNo);

		model.addAttribute("categoryApproveList", categoryDao.approveList());
		model.addAttribute("projectDto", projectDto);
		
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
		int projectNo = projectDao.sequence();
		projectCategoryVo.setProjectNo(projectNo);
		projectDao.insertBySequence(projectCategoryVo);
		
		
		
		return "redirect:" + projectNo + "/projectMain/";
	}
	
	@GetMapping("/{projectNo}/projectMain")
	public String projectMain(
			@ModelAttribute ProjectDto projectDto,
			@PathVariable int projectNo,
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		projectDto = ProjectDto.builder()
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		CategoryDto theme = categoryDao.getByNo(find.getCategoryNo());
		CategoryDto theme2 = categoryDao.getByNo(theme.getCategorySuper());
		
		model.addAttribute("categoryDto", theme);
		model.addAttribute("categoryDto2", theme2);
		
		return "project/projectMain";
	}
	
	@Autowired
	private ImageDao imageDao;
	
	@GetMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(
			@PathVariable int projectNo,
			HttpSession session,
			Model model){
		
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder()
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		//프로젝트 카테고리의 정보 조회
		CategoryDto categoryDto = categoryDao.getByNo(find.getCategoryNo());
		//현재 프로젝트의 카테고리 정보
		model.addAttribute("category", categoryDto);
		model.addAttribute("categoryList", categoryDao.userCustomList(find.getCategoryNo()));
	
		ImageDto imageDto = imageDao.getProjectMainByProjectNo(find.getProjectNo());
		
		if(imageDto != null) {
			model.addAttribute("image", imageDto);
		}
		else {
			model.addAttribute("image", "noImgae");
		}
		
		return "project/projectMainDefault";
	}
	
	@PostMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(
			@PathVariable int projectNo,
			@ModelAttribute ProjectDto projectDto) {
		boolean result = projectDao.projectDefaultUpdate(projectDto);
		
		if(result) {
			return "redirect:projectMainDefault";
		}
		else {
			return "redirect:projectMainDefautlt?error";
		}
		
		
	}
	
	
	@GetMapping("/{projectNo}/projectMainFunding")
	public String projectFunding(
			@PathVariable int projectNo,
			HttpSession session,
			Model model) {
		
		int memberNo = (int)session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder()
				.projectNo(projectNo)
				.memberNo(memberNo)
				.build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		String plus7 = projectDao.projectEndDatePlus7(projectNo);
		String plus14 = projectDao.projectEndDatePlus14(projectNo);
		model.addAttribute("plus7", plus7);
		model.addAttribute("plus14", plus14);
		
		return "project/projectMainFunding";
	}
	
	@PostMapping("/{projectNo}/projectMainFunding")
	public String projectMainFunding(
			@PathVariable int projectNo,
			@ModelAttribute ProjectDto projectDto) {
		boolean result = projectDao.projectFundingUpdate(projectDto);
		
		if(result) {
			return "redirect:projectMainFunding";
		}
		else {
			return "redirect:projectMainFunding?error";
		}
	}
	
	
	@GetMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(@PathVariable int projectNo, Model model) {
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
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
	
	@PostMapping("/{projectNo}/projectMainGiftItemDelete")
	public String projectMainGiftItemDelete(@PathVariable int projectNo, @RequestParam int itemNo) {
		itemDao.delete(itemNo);
		return "redirect:projectMainGiftItem";
	}

}
