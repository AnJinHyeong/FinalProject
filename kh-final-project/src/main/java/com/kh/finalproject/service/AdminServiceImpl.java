package com.kh.finalproject.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.vo.AdminMemberVO;
@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSession sqlSession;

		@Override
		public List<AdminMemberVO> memberSearchAll() {
			return sqlSession.selectList("admin.memberSearchAll");
		}

		@Override
		public List<AdminMemberVO> paySearchAll() {
			return sqlSession.selectList("admin.paySearchAll");
		}

}
