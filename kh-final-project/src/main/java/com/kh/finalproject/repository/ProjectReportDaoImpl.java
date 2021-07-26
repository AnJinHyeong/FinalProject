package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectReportDto;

@Repository
public class ProjectReportDaoImpl implements ProjectReportDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProjectReportDto projectReportDto) {
		sqlSession.insert("projectReport.insert", projectReportDto);
	}
	
}
