package com.kh.finalproject.controller;

import java.util.List;

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
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.ImageDao;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.vo.GiftSelectedItemVo;
import com.kh.finalproject.vo.ItemListVo;
import com.kh.finalproject.vo.ProjectCategoryVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
@Slf4j
public class ProjectController {

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private ProjectDao projectDao;

	@GetMapping("/projectInsert")
	public String projectInsert(HttpSession session, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = projectDao.workingProject(memberNo);

		model.addAttribute("categoryApproveList", categoryDao.approveList());
		model.addAttribute("projectDto", projectDto);

		return "project/projectInsert";
	}

	@PostMapping("/projectInsert")
	public String projectInsert(@ModelAttribute ProjectCategoryVo projectCategoryVo) {
		String categoryTheme = projectCategoryVo.getCategoryTheme();
		int categoryNo;
		if (categoryDao.isExist(categoryTheme)) {
			categoryNo = categoryDao.get(categoryTheme).getCategoryNo();
		} else {
			int sequence = categoryDao.getSequence();
			categoryNo = sequence;
			categoryDao.insert(CategoryDto.builder().categoryNo(sequence).categoryTheme(categoryTheme).build());
		}
		projectCategoryVo.setCategoryNo(categoryNo);
		int projectNo = projectDao.sequence();
		projectCategoryVo.setProjectNo(projectNo);
		projectDao.insertBySequence(projectCategoryVo);

		return "redirect:" + projectNo + "/projectMain/";
	}

	@GetMapping("/{projectNo}/projectMain")
	public String projectMain(@ModelAttribute ProjectDto projectDto, @PathVariable int projectNo, HttpSession session, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);

		CategoryDto theme = categoryDao.getByNo(find.getCategoryNo());
		CategoryDto theme2 = categoryDao.getByNo(theme.getCategorySuper());
		
		model.addAttribute("categoryDto", theme);
		model.addAttribute("categoryDto2", theme2);
		
		return "project/projectMain";
	}
	
	@GetMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(@PathVariable int projectNo, HttpSession session, Model model) {

		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		//프로젝트 카테고리의 정보 조회
		CategoryDto categoryDto = categoryDao.getByNo(find.getCategoryNo());
		model.addAttribute("category", categoryDto);
		
		return "project/projectMainDefault";
	}

	@PostMapping("/{projectNo}/projectMainDefault")
	public String projectMainDefault(@PathVariable int projectNo, @ModelAttribute ProjectDto projectDto) {
		boolean result = projectDao.projectDefaultUpdate(projectDto);

		return "redirect:projectMainDefault";

	}

	@GetMapping("/{projectNo}/projectMainFunding")
	public String projectFunding(@PathVariable int projectNo, HttpSession session, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);

		String plus7 = projectDao.projectEndDatePlus7(projectNo);
		String plus14 = projectDao.projectEndDatePlus14(projectNo);
		model.addAttribute("plus7", plus7);
		model.addAttribute("plus14", plus14);

		return "project/projectMainFunding";
	}

	@PostMapping("/{projectNo}/projectMainFunding")
	public String projectMainFunding(@PathVariable int projectNo, @ModelAttribute ProjectDto projectDto) {
		projectDao.projectFundingUpdate(projectDto);
		return "redirect:projectMainFunding";
	}

	@Autowired
	private GiftDao giftDao;

	@GetMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(HttpSession session,@PathVariable int projectNo, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
		model.addAttribute("giftCount", giftDao.count(projectNo));
		model.addAttribute("giftList", giftDao.listByProjectNo(projectNo));
		model.addAttribute("giftItemVoList", giftDao.list());
		return "project/projectMainGift";
	}

	@GetMapping("/{projectNo}/projectMainGiftItem")
	public String projectMainGiftItem(HttpSession session, @PathVariable int projectNo, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);
		
		model.addAttribute("itemCount", itemDao.count(projectNo));
		model.addAttribute("itemList", itemDao.list(projectNo));
		return "project/projectMainGiftItem";
	}

	@PostMapping("/{projectNo}/projectMainGift")
	public String projectMainGift(@ModelAttribute GiftSelectedItemVo giftSelectedItemVo,
			@PathVariable int projectNo) {
		int giftNo = giftDao.getSequence();
		giftDao.insertBySequence(GiftDto.builder().projectNo(projectNo).giftNo(giftNo)
				.giftPrice(giftSelectedItemVo.getGiftPrice()).giftSummary(giftSelectedItemVo.getGiftSummary()).build());
		List<ItemListVo> itemList = giftSelectedItemVo.getItemList();

//		log.debug("itemList = {}", itemList);
		
		if(itemList != null) {
			giftDao.insert(itemList, giftNo);
		}

		return "redirect:projectMainGift";
	}

	@PostMapping("/{projectNo}/projectMainGiftDelete")
	public String projectMainGiftDelete(@PathVariable int projectNo, @RequestParam int giftNo) {
		giftDao.delete(giftNo);
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
	
	@Autowired
	private MemberDao MemberDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@GetMapping("/{projectNo}/projectMainMember")
	public String projectMainMember(
			HttpSession session,
			@PathVariable int projectNo,
			Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);

		MemberDto memberDto = MemberDao.getByMemberNo(find.getMemberNo());
		model.addAttribute("memberDto", memberDto);
		
		int count = imageDao.confirmMember(memberNo);
		model.addAttribute("count", count);
		
		return "project/projectMainMember";
	}
	
	@PostMapping("/{projectNo}/projectMainMember")
	public String projectMainMember(@ModelAttribute ProjectDto projectDto ,@PathVariable int projectNo) {
		projectDao.projectMemberUpdate(projectDto);
		return "redirect:projectMainMember";
	}
	@GetMapping("/{projectNo}/projectMainStory")
	public String projectMainStory(@PathVariable int projectNo, HttpSession session, Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		ProjectDto projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", projectDao.get(find));
		return "project/projectMainStory";
	}

	@PostMapping("/{projectNo}/projectMainStory")
	public String projectMainStory(@PathVariable int projectNo, @ModelAttribute ProjectDto projectDto) {
		log.info(projectDto.toString());
		projectDto.setProjectNo(projectNo);
		projectDao.projectStoryUpdate(projectDto);
		return "redirect:projectMainStory";
	}
	
	@GetMapping("/{projectNo}/projectMainApproval")
	public String projectMainApproval(
			@PathVariable int projectNo,
			HttpSession session,
			@ModelAttribute ProjectDto projectDto,
			Model model) {
		
		int memberNo = (int) session.getAttribute("memberNo");
		projectDto = ProjectDto.builder().projectNo(projectNo).memberNo(memberNo).build();
		ProjectDto find = projectDao.get(projectDto);
		model.addAttribute("projectDto", find);

		CategoryDto theme = categoryDao.getByNo(find.getCategoryNo());
		CategoryDto theme2 = categoryDao.getByNo(theme.getCategorySuper());
		
		model.addAttribute("categoryDto", theme);
		model.addAttribute("categoryDto2", theme2);
		
		return "project/projectMainApproval";
	}
	
	@PostMapping("/{projectNo}/projectMainApproval")
	public String projectMainApproval(@PathVariable int projectNo) {
		projectDao.projectApprovalUpdate2(projectNo);
		return "redirect:projectMainApproval";
	}
	
	@PostMapping("/{projectNo}/projectMainApprovalCancel")
	public String projectMainApprovalCancel(@PathVariable int projectNo) {
		projectDao.projectApprovalUpdate1(projectNo);
		return "redirect:projectMainApproval";
	}
	
	
	
}
