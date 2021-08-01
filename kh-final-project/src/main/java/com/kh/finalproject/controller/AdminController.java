package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.service.AdminService;
import com.kh.finalproject.vo.AdminMemberVO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@GetMapping("")
	public String adminHome() {
		return "admin/adminHome";
	}
	
	@GetMapping("/adminProjectSelect")
	public String adminProjectSelect() {
		
		return "admin/adminProjectSelect";
	}
	
	@GetMapping("/adminMemberSearchAll")
	public String adminMemberSearchAll() {
		return "admin/adminMemberSearchAll";
	}
	
	@PostMapping("/adminMemberSearchAll")
	public String adminMemberSearchAll(Model model,String searchOption, String keyWord) {
		List<AdminMemberVO> list = adminService.memberSearchAll(searchOption, keyWord);
		
		model.addAttribute("memberTable",list);
		model.addAttribute("count",adminService.memberCount(searchOption, keyWord));

		return "admin/adminMemberSearchAll";
	}
	
	
	@GetMapping("/adminPaySearchAll")
	public String adminPaySearchAll() {
		
		return "admin/adminPaySearchAll";
	}

	@PostMapping("/adminPaySearchAll")
	public String adminPaySearchAll(Model model,String searchOption, String keyWord) {
		List<AdminMemberVO> list = adminService.paySearchAll(searchOption, keyWord);
		
		model.addAttribute("payTable",list);
		model.addAttribute("count",adminService.payCount(searchOption, keyWord));

		return "admin/adminPaySearchAll";
	}

	@Autowired
	private BannerDao bannerDao;
	
	@GetMapping("/adminBanner")
	public String adminBanner(Model model) {
		model.addAttribute("bannerList", bannerDao.getBannerList());
		return "admin/adminBanner";
	}
	
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/adminCategory")
	public String adminCategory(Model model) {
		model.addAttribute("categoryList", categoryDao.getCategoryList());
		return "admin/adminCategory";
	}
	
	@GetMapping("/adminRequest")
	public String adminRequest(Model model) {
		
		return "admin/adminRequest";
	}
	
	
	
	
}
