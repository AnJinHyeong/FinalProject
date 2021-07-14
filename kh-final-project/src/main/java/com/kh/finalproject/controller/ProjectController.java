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
import com.kh.finalproject.entity.GiftDto;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.ItemDao;
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
		
		model.addAttribute("categoryDto", theme);
		
		return "project/projectMain";
	}
	
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
		
		model.addAttribute("categoryDto", categoryDao.userCustomList(find.getCategoryNo()));
		model.addAttribute("category", categoryDao.getByNo(find.getCategoryNo()));
		
		
		return "project/projectMainDefault";
	}
	
	@PostMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(
			@PathVariable int projectNo,
			@ModelAttribute ProjectDto projectDto,
			Model model) {
		boolean result = projectDao.projectUpdate(projectDto);
		
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
		
		return "project/projectMainFunding";
	}
	
	@Autowired
	private GiftDao giftDao;
	
	@GetMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(@PathVariable int projectNo, Model model) {
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
		model.addAttribute("giftCount", giftDao.count(projectNo));
		model.addAttribute("giftList", giftDao.listByProjectNo(projectNo));
		return "project/projectMainGift";
	}
	
	@GetMapping("/{projectNo}/projectMainGiftItem")
	public String projectMainGiftItem(@PathVariable int projectNo, Model model) {
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
		return "project/projectMainGiftItem";
	}
	
	@PostMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(HttpSession session, @ModelAttribute GiftDto giftDto, @PathVariable int projectNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		giftDto.setProjectNo(projectNo);
		giftDto.setMemberNo(memberNo);
		giftDao.insert(giftDto);
		return "redirect:projectMainGift";
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
