package com.kh.finalproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.SponsorDto;

public interface PointService {
	void usePoint(int projectNo, HttpSession session, SponsorDto sponsorDto);
	
	void cancelSponsor(HttpSession session, @RequestParam int sponsorNo);
}
