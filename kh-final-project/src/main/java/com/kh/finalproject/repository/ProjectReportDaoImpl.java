package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectReportDto;
import com.kh.finalproject.vo.ProjectReportListVo;

@Repository
public class ProjectReportDaoImpl implements ProjectReportDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProjectReportDto projectReportDto) {
		sqlSession.insert("projectReport.insert", projectReportDto);
	}

	@Override
	public List<ProjectReportListVo> projectReportList1() {
		return sqlSession.selectList("projectReport.projectReportList1");
	}

	@Override
	public List<ProjectReportDto> projectReportList2(int reportProjectNo) {
		return sqlSession.selectList("projectReport.projectReportList2", reportProjectNo);
	}

	
}
