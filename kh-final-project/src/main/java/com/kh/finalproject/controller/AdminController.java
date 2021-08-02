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

import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.repository.MessageDao;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	MessageDao messageDao;
	@GetMapping("")
	public String adminHome() {
		return "admin/adminHome";
	}
	@GetMapping("/adminMsg") 
	public String adminMsg(HttpSession session,Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		List<MessageDto> find = messageDao.msgAllByMemberNo(memberNo);

		model.addAttribute("messageDto", find);

		

		List<MessageDto> find2 = messageDao.msgReceiverByMemberNo(memberNo);

		model.addAttribute("messageDto2", find2);

		

		List<MessageDto> find3 = messageDao.msgSendByMemberNo(memberNo);

		model.addAttribute("messageDto3", find3);
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
}
