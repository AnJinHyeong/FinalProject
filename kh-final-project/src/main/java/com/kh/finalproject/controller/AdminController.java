package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.service.AdminService;

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
	public String adminMemberSearchAll(Model model) {
		
		model.addAttribute("list",adminService.memberSearchAll());
		return "admin/adminMemberSearchAll";
	}
	
	@GetMapping("/adminPaySearchAll")
	public String adminPaySearchAll(Model model) {
		
		model.addAttribute("list",adminService.memberSearchAll());
		return "admin/adminPaySearchAll";
	}


	
}
