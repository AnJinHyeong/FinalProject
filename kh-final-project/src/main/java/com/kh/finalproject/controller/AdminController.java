package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.AdminService;
import com.kh.finalproject.vo.AdminMemberVO;
import com.kh.finalproject.vo.MsgVo;


@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	MessageDao messageDao;

	@Autowired
	AdminService adminService;
	

	@GetMapping("")
	public String adminHome() {
		return "admin/adminHome";
	}

	@GetMapping("/adminMsg") 
	public String adminMsg(HttpSession session,Model model) {
		model.addAttribute("msgVoList", messageDao.msgAll());
		return "admin/adminMsg";
	}
	
	@PostMapping("/adminMsg")
	public String adminMsg(HttpSession session,Model model, @RequestParam String keyword) {
		if(keyword.equals("")) {
			model.addAttribute("msgVoList", messageDao.msgAll());
		}
		else {
			model.addAttribute("msgVoList", messageDao.msgAll(keyword));
		}
		return "admin/adminMsg";
	}
	
	
	@GetMapping("/adminMsgWrite")
	public String adminMsgWrite() {
		return "/admin/adminMsgWrite";
	}
	
	@PostMapping("/adminMsgInsert")
	public String adminMsgInsert(Model model,HttpSession session,@ModelAttribute MessageDto messageDto) {
		int senderNo= (int)session.getAttribute("memberNo");

		int receiverNo = 1;

		messageDto.setSenderNo(senderNo);

		messageDto.setReceiverNo(receiverNo);

		messageDao.msgWrite2(messageDto);

		try {

			model.addAttribute("msg","쪽지가 발송되었습니다.");

			model.addAttribute("url","/member/closeMember");

			

		}catch(Exception e) {

			model.addAttribute("msg","쪽지가 발송이 실패했습니다.");

			model.addAttribute("url","/member/closeMember");

		}

		return "/member/redirectMember";
		
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
