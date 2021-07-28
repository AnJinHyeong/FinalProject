package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.vo.RequestVo;

@Repository
public class RequestDaoImpl implements RequestDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(RequestDto requestDto) {
		sqlSession.insert("request.insert", requestDto);
	}

	@Override
	public List<RequestVo> selectAll() {
		return sqlSession.selectList("request.selectAll");
	}

	@Override
	public RequestVo getByRequestNo(int requestNo) {
		return sqlSession.selectOne("request.getByRequestNo", requestNo);
	}
	
	
	
}
