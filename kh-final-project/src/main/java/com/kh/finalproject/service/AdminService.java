package com.kh.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.finalproject.vo.AdminMemberVO;

@Service
public interface AdminService {
	List<AdminMemberVO> memberSearchAll(String searchOption, String keyWord);
	List<AdminMemberVO> paySearchAll(String searchOption, String keyWord);
	int memberCount(String searchOption, String keyWord);
	int payCount(String searchOption, String keyWord);
	
}
