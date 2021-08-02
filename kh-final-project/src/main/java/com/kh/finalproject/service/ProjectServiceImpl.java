package com.kh.finalproject.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private SqlSession sqlSession;
	
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public boolean projectApprovalUpdate4() {
		int count = sqlSession.update("project.projectApprovalUpdate4");
		
		
		log.info("프로젝트 상태 4업데이트");
		return count > 0;
	}

}
