package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.repository.RequestDao;
import com.kh.finalproject.vo.RequestAdminSearchKeywordVo;
import com.kh.finalproject.vo.RequestAdminSearchVo;
import com.kh.finalproject.vo.RequestReplyVo;
import com.kh.finalproject.vo.RequestVo;


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
	
	@PostMapping("/requestAdminSearch")
	public List<RequestVo> requestAdminSearch(
			@RequestParam String keyword,
			@RequestParam String requestOrderBy,
			@RequestParam String searchType) {
		RequestAdminSearchKeywordVo searchData = RequestAdminSearchKeywordVo.builder()
				.searchType(searchType)
				.requestOrderBy(requestOrderBy)
				.keyword(keyword)
				.build();
		
		int length1;
		int length2;
		int length3;
		if(searchType.equals("null")) {
			length1 = 0;
		}
		else{
			length1 = 1;
		}
		if(requestOrderBy.equals("null")) {
			length2 = 0;
		}
		else{
			length2 = 1;
		}
		if((keyword == null || keyword.equals(""))) {
			length3 = 0;
		}
		else{
			length3 = 1;
		}
		
		if(length1 == 0 && length2 == 1 && length3 == 0) {
			List<RequestVo> list = requestDao.requestAdminSelect2(searchData);
			return list;
		}
		else if(length1 == 1 && length2 == 0 && length3 == 1) {
			List<RequestVo> list = requestDao.requestAdminSelect3(searchData);
			return list;
		}
		else if(length1 == 1 && length2 == 1 && length3 == 1) {
			List<RequestVo> list = requestDao.requestAdminSelect4(searchData);
			return list;
		}
		else {
			List<RequestVo> list = requestDao.requestAdminSelect1();
			return list;
		}
				
	}
	
	@PostMapping("/adminRequestSelectOne")
	public RequestAdminSearchVo adminRequestSelectOne(@RequestParam int requestNo) {
		return requestDao.adminRequestSelectOne(requestNo);
	}
	
	@GetMapping("/adminDeleteRequest")
	public void adminDeleteRequest(@RequestParam int requestNo) {
		requestDao.adminDeleteRequest(requestNo);
	}
	
	@PostMapping("/adminReplyList")
	public List<RequestReplyVo> adminReplyList(@RequestParam int requestNo){
		List<RequestReplyVo> list = requestDao.replyList(requestNo);
		return list;
	}
	


}
