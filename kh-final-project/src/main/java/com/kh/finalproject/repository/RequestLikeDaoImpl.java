package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ProjectLikeDto;
import com.kh.finalproject.entity.RequestLikeDto;
import com.kh.finalproject.vo.ProjectLikeVo;

@Repository
public class RequestLikeDaoImpl implements RequestLikeDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void add(RequestLikeDto requestLikeDto) {
		sqlSession.insert("requestLike.add", requestLikeDto);
	}

	@Override
	public boolean delete(RequestLikeDto requestLikeDto) {
		int count = sqlSession.delete("requestLike.delete", requestLikeDto);
		return count > 0;
	}

	@Override
	public int confirm(RequestLikeDto requestLikeDto) {
		int count = sqlSession.selectOne("requestLike.confirm", requestLikeDto);
		return count;
	}

//	@Override
//	public List<ProjectLikeDto> myLikeProject(int memberNo) {
//		return sqlSession.selectList("projectLike.myLikeProject", memberNo);
//	}
//
//	@Override
//	public List<ProjectLikeVo> myLikeProjectList(int memberNo) {
//		return sqlSession.selectList("projectLike.myLikeProjectList", memberNo);
//	}

	
	
}
