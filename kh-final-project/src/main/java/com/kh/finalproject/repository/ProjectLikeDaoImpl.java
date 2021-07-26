package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectLikeDto;
import com.kh.finalproject.vo.ProjectLikeVo;

@Repository
public class ProjectLikeDaoImpl implements ProjectLikeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void add(ProjectLikeDto projectLikeDto) {
		sqlSession.insert("projectLike.add", projectLikeDto);
	}

	@Override
	public boolean delete(ProjectLikeDto projectLikeDto) {
		int count = sqlSession.delete("projectLike.delete", projectLikeDto);
		return count > 0;
	}

	@Override
	public int confirm(ProjectLikeDto projectLikeDto) {
		int count = sqlSession.selectOne("projectLike.confirm", projectLikeDto);
		return count;
	}

	@Override
	public List<ProjectLikeDto> myLikeProject(int memberNo) {
		return sqlSession.selectList("projectLike.myLikeProject", memberNo);
	}

	@Override
	public List<ProjectLikeVo> myLikeProjectList(int memberNo) {
		return sqlSession.selectList("projectLike.myLikeProjectList", memberNo);
	}
	
	
}
