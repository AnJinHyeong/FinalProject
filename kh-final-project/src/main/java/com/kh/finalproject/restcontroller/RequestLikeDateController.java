package com.kh.finalproject.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.RequestLikeDto;
import com.kh.finalproject.repository.RequestDao;
import com.kh.finalproject.repository.RequestLikeDao;

@RestController
@RequestMapping("/requestLike")
public class RequestLikeDateController {

	@Autowired
	private RequestLikeDao requestLikeDao;
	
	@Autowired
	private RequestDao requestDao;
	
	@PostMapping("/requestLikeConfirm/{requestNo}")
	public int projectLikeConfirm(
			@PathVariable int requestNo,
			HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		RequestLikeDto requestLikeDto = RequestLikeDto.builder()
				.requestLikeMemberNo(memberNo)
				.requestLikeNo(requestNo)
				.build();
		
		int count = requestLikeDao.confirm(requestLikeDto);
		return count;
	}
	
	
	@GetMapping("/requestLikeAdd/{requestNo}")
	public void projectLikeAdd(
			HttpSession session,
			@PathVariable int requestNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		RequestLikeDto requestLikeDto = RequestLikeDto.builder()
				.requestLikeMemberNo(memberNo)
				.requestLikeNo(requestNo)
				.build();
		
		requestDao.likeCountUp(requestNo);
		
		requestLikeDao.add(requestLikeDto);
	}
	
	@GetMapping("/requestLikeDelete/{requestNo}")
	public void projectLikeDelete(
			HttpSession session,
			@PathVariable int requestNo) {
		int memberNo = (int)session.getAttribute("memberNo");
		RequestLikeDto requestLikeDto = RequestLikeDto.builder()
				.requestLikeMemberNo(memberNo)
				.requestLikeNo(requestNo)
				.build();
		
		requestDao.likeCountDown(requestNo);
		
		requestLikeDao.delete(requestLikeDto);
	}
	
	
	
}
