package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.vo.ProjectCategoryVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProjectCategoryVo projectCategoryVo) {
		sqlSession.insert("project.insert", projectCategoryVo);
	}

	@Override
	public List<ProjectDto> list(int memberNo) {
		List<ProjectDto> projectDto = sqlSession.selectList("project.list", memberNo);
		return projectDto;
	}

	@Override
	public ProjectDto listOne(ProjectDto projectDto) {
		return sqlSession.selectOne("project.get",projectDto);
	}

}
