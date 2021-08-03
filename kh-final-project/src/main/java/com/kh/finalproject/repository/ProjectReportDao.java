package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ProjectReportDto;
import com.kh.finalproject.vo.ProjectReportListVo;

public interface ProjectReportDao {
	
	//신고하기
	void insert(ProjectReportDto projectReportDto);
	List<ProjectReportListVo> projectReportList1();
	List<ProjectReportListVo> projectReportList2(int reportProjectNo);

}
