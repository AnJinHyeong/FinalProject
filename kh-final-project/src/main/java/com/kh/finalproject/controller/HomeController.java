package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
}
