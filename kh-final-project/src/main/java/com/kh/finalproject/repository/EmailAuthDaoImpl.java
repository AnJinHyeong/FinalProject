package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.EmailAuthDto;

@Repository
public class EmailAuthDaoImpl implements EmailAuthDao{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(EmailAuthDto emailAuthDto) {
		sqlSession.insert("member.insert2", emailAuthDto);
		
	}

	@Override
	public boolean check(EmailAuthDto emailAuthDto) {
		EmailAuthDto find = sqlSession.selectOne("member.check", emailAuthDto);
		return find != null;
	}

	@Override
	public void deleteByEmail(String email) {
		sqlSession.delete("member.deleteByEmail", email);
		
	}

	@Override
	public void clear() {
		sqlSession.delete("member.deleteByTime");
		
	}

}
