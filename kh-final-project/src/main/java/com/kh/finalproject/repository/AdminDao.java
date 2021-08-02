package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.vo.AdminMemberVO;

public interface AdminDao {
	List<AdminMemberVO> memberSearchAll(String searchOption, String keyWord);
	List<AdminMemberVO> paySearchAll(String searchOption, String keyWord);
	int memberCount(String searchOption, String keyWord);
	int payCount(String searchOption, String keyWord);
}
