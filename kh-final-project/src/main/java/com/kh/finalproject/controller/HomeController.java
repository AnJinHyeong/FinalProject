package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.ImageDao;
import com.kh.finalproject.service.FileService;
import com.kh.finalproject.service.PointService;

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
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/deleteLocalFileNotInDB")
	public String deleteLocalFileNotInDB() {
		fileService.deleteLocalFileNotInDB();
		return "redirect:/admin";
	}
	
	@Autowired
	private PointService pointService;
	
	@GetMapping("/givePointByFinishedProject")
	public String givePointByFinishedProject() {
		pointService.finishedProjectGiveAmount();
		return "redirect:/admin";
	}
	
}
