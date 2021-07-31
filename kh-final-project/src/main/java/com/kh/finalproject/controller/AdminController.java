package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@GetMapping("")
	public String adminHome() {
		return "admin/adminHome";
	}
	
	@GetMapping("/adminProjectSelect")
	public String adminProjectSelect() {
		
		return "admin/adminProjectSelect";
	}

	@GetMapping("/adminBanner")
	public String adminBanner() {
		
		return "admin/adminBanner";
	}


	
}
