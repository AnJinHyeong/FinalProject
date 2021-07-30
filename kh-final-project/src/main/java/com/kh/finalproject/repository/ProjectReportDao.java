package com.kh.finalproject.repository;

import com.kh.finalproject.entity.ProjectReportDto;

public interface ProjectReportDao {
	
	//신고하기
	void insert(ProjectReportDto projectReportDto);
	
}
