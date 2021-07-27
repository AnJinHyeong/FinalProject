package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectCommunityDto;

@Repository
public class ProjectCommunityDaoImpl implements ProjectCommunityDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProjectCommunityDto projectCommunityDto) {
		sqlSession.insert("projectCommunity.insert", projectCommunityDto);
	}

	@Override
	public List<ProjectCommunityDto> listByProjectNo(int projectNo) {
		return sqlSession.selectList("projectCommunity.listByProjectNo", projectNo);
	}

	@Override
	public List<ProjectCommunityDto> listByProjectNo2(int projectNo) {
		return sqlSession.selectList("projectCommunity.listByProjectNo2", projectNo);
	}

	@Override
	public boolean delete(ProjectCommunityDto projectCommunityDto) {
		int count = sqlSession.delete("projectCommunity.delete", projectCommunityDto);
		return count > 0;
	}

	@Override
	public boolean deleteByProjectNo(ProjectCommunityDto projectCommunityDto) {
		int count = sqlSession.delete("projectCommunity.deleteByProjectNo", projectCommunityDto);
		return count > 0;
	}

}
