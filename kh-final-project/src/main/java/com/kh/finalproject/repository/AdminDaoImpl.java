package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectReportDto;
import com.kh.finalproject.vo.AdminMemberVO;

@Repository
public class AdminDaoImpl implements AdminDao{
@Autowired
SqlSession sqlSession;

	
	@Override
	public List<AdminMemberVO> memberSearchAll(String searchOption, String keyWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		return sqlSession.selectList("admin.memberSearchAll", map);
	}

	@Override
	public List<AdminMemberVO> paySearchAll(String searchOption, String keyWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		return sqlSession.selectList("admin.paySearchAll", map);
	}

	@Override
	public int memberCount(String searchOption, String keyWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		return sqlSession.selectOne("admin.memberCount", map);
	}

	@Override
	public int payCount(String searchOption, String keyWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		return sqlSession.selectOne("admin.payCount", map);
	}

	@Override
	public List<ProjectReportDto> projectReportList(int projectNo) {
		return sqlSession.selectList("admin,projectReportList", projectNo);
	}

}
