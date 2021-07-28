package com.kh.finalproject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.ImageDao;
import com.kh.finalproject.service.BannerService;

@Controller
public class HomeController {
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private BannerDao bannerDao;
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("mainBannerImageList", imageDao.getListMainBanner());
		model.addAttribute("mainBannerImageCount", imageDao.getCountMainBanner());
		model.addAttribute("startBannerDto", bannerDao.getBannerByIndexNo(1));
		return "index";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
	@GetMapping("/banner/bannerInsert")
	public String bannerInsert() {
		return "banner/bannerInsert";
	}
	
	@Autowired
	private BannerService bannerService;
	
	@PostMapping("/banner/bannerInsert")
	public String bannerInsert(@ModelAttribute BannerDto bannerDto, @RequestParam MultipartFile bannerImage) throws IllegalStateException, IOException {
		
		bannerService.insertMainBanner(bannerDto, bannerImage);
		
		return "redirect:/";
	}
	
}
