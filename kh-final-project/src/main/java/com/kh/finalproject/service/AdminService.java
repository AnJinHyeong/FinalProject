package com.kh.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.finalproject.vo.AdminMemberVO;

@Service
public interface AdminService {
	List<AdminMemberVO> memberSearchAll();
	List<AdminMemberVO> paySearchAll();
	
}
