package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.CategoryDto;
import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.repository.CategoryDao;
import com.kh.finalproject.repository.RequestDao;
import com.kh.finalproject.vo.RequestVo;

@Controller
@RequestMapping("/requestBoard")
public class RequestBoardController {
	
	@Autowired
	private RequestDao requestDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@GetMapping("/requestBoard")
	public String requestBoard(
			Model model) {
		List<CategoryDto> categoryDto = categoryDao.approveList();
		model.addAttribute("category", categoryDto);
		
		List<RequestVo> requestVo = requestDao.selectAll();
		model.addAttribute("request", requestVo);
		
		return "requestBoard/requestBoard";
	}
	
	@PostMapping("/requestInsert")
	public String requestInsert(
			HttpSession session,
			@ModelAttribute RequestDto requestDto) {
		int memberNo = (int)session.getAttribute("memberNo");
		
		RequestDto find = RequestDto.builder()
				.requestTitle(requestDto.getRequestTitle())
				.requestContent(requestDto.getRequestContent())
				.requestMemberNo(memberNo)
				.requestCategoryNo(requestDto.getRequestCategoryNo())
				.build();
		
		requestDao.insert(find);
		
		return "redirect:requestBoard";
		
	}
	
	@GetMapping("/requestBoardContent/{requestNo}")
	public String requestBoardContent(
			Model model,
			@PathVariable int requestNo) {
		
		RequestVo requestVo = requestDao.getByRequestNo(requestNo);
		model.addAttribute("request", requestVo);
		
		return "requestBoard/requestBoardContent";
	}
	
	
}
