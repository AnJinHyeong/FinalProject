package com.kh.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.vo.AdminMemberVO;
@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<AdminMemberVO> memberSearchAll(String searchOption, String keyWord) {
		return adminDao.memberSearchAll(searchOption, keyWord);
	}

	@Override
	public List<AdminMemberVO> paySearchAll(String searchOption, String keyWord) {
		return adminDao.paySearchAll(searchOption, keyWord);
	}

	@Override
	public int memberCount(String searchOption, String keyWord) {
		return adminDao.memberCount(searchOption, keyWord);
	}

	@Override
	public int payCount(String searchOption, String keyWord) {
		return adminDao.payCount(searchOption, keyWord);
	}

//	@Autowired
//	private SqlSession sqlSession;
//
//		@Override
//		public List<AdminMemberVO> memberSearchAll(String searchOption, String keyWord) {
//			return sqlSession.selectList("admin.memberSearchAll");
//		}
//
//		@Override
//		public List<AdminMemberVO> paySearchAll(String searchOption, String keyWord) {
//			return sqlSession.selectList("admin.paySearchAll");
//		}
//
//		@Override
//		public int memberCount(String searchOption, String keyWord) {
//			return sqlSession.selectList("admin.paySearchAll");
//		}
//
//		@Override
//		public int payCount(String searchOption, String keyWord) {
//			return sqlSession.selectList("admin.paySearchAll");
//		}

}
