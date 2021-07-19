package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.vo.ProjectCategoryVo;
import com.kh.finalproject.vo.ProjectDatePlusVo;

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
	public ProjectDto get(ProjectDto projectDto) {
		return sqlSession.selectOne("project.get",projectDto);
	}
	
	public void insertBySequence(ProjectCategoryVo projectCategoryVo) {
		sqlSession.insert("project.insertBySequence", projectCategoryVo);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("project.sequence");
	}

	@Override
	public boolean projectDefaultUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectDefaultUpdate",projectDto);
		return count > 0;
	}
	
	@Override
	public boolean projectFundingUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectFundingUpdate",projectDto);
		return count > 0;
	}

	@Override
	public String projectEndDatePlus7(int projectNo) {
		return sqlSession.selectOne("project.projectEndDatePlus7",projectNo);
	}

	@Override
	public String projectEndDatePlus14(int projectNo) {
		return sqlSession.selectOne("project.projectEndDatePlus14",projectNo);
	}

	@Override
	public ProjectDto workingProject(int memberNo) {
		return sqlSession.selectOne("project.workingProject",memberNo);
	}

	@Override
	public boolean projectMemberUpdate(ProjectDto projectDto) {
		int count = sqlSession.update("project.projectMemberUpdate",projectDto);
		return count > 0;
	}
	
}
