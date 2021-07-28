package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.repository.RequestDao;


@RequestMapping("/request")
@RestController
public class RequestDataController {

	@Autowired
	private RequestDao requestDao;
	
	@PostMapping("/requestReplyCount")
	public int requestReplyCount(@RequestParam int requestNo) {
		return requestDao.replyCount(requestNo);
	}
	
	@PostMapping("/requestLikeList")
	public List<RequestDto> requestLikeList(){
		List<RequestDto> likeList =  requestDao.selectLikeTop5();
		return likeList;
	}
	
	@PostMapping("/requestViewList")
	public List<RequestDto> requestViewList(){
		List<RequestDto> viewList = requestDao.selectViewTop5();
		return viewList;
	}


}
