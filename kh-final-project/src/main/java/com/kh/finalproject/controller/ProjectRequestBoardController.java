package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ProjectCommunityDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.entity.ProjectReportDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.error.PercentCalcFailException;
import com.kh.finalproject.error.SponFailException;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.GiftDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.ProjectCommunityDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.repository.ProjectReportDao;
import com.kh.finalproject.repository.SponsorDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/projectRequestBoard")
public class ProjectRequestBoardController {
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private GiftDao giftDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SponsorDao sponsorDao;
	
	@GetMapping("/projectRequestBoard")
	public String projectRequestBoard() {
		
		return "projectRequestBoard/projectRequestBoard";
	}
	
}
