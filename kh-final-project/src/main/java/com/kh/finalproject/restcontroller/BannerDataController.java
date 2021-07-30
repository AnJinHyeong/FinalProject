package com.kh.finalproject.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.repository.BannerDao;

@RestController
@RequestMapping("/banner/data")
public class BannerDataController {

	@Autowired
	private BannerDao bannerDao;
	
	@PostMapping("/getBanner")
	public BannerDto getBanner(@RequestParam int bannerNo) {
		return bannerDao.getBanner(bannerNo);
	}
	
	@PostMapping("/getBannerByIndexNo")
	public BannerDto getBannerByIndexNo(@RequestParam int indexNo) {
		return bannerDao.getBannerByIndexNo(indexNo);
	}
}
