package com.kh.finalproject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.service.BannerService;
import com.kh.finalproject.vo.BannerVo;

@Controller
@RequestMapping("/banner")
public class BannerController {

	@GetMapping("/bannerInsert")
	public String bannerInsert() {
		return "banner/bannerInsert";
	}
	
	@Autowired
	private BannerService bannerService;
	
	@PostMapping("/bannerInsert")
	public String bannerInsert(@ModelAttribute BannerVo bannerVo) throws IllegalStateException, IOException {
		
		bannerService.insertMainBanner(bannerVo);
		
		return "redirect:bannerList";
	}
	
	@Autowired
	private BannerDao bannerDao;
	
	@GetMapping("/bannerList")
	public String bannerList(Model model) {
		model.addAttribute("bannerList", bannerDao.getBannerList());
		return "admin/adminBanner";
	}
	
	@GetMapping("/bannerDelete")
	public String bannerDelete(@ModelAttribute BannerVo bannerVo) {
		
		bannerService.deleteMainBanner(bannerVo);
		
		return "redirect:bannerList";
	}
	
}
