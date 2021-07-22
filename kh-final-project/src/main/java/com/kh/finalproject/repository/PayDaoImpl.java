package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PayDto;

@Repository
public class PayDaoImpl implements PayDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getSequence() {
		return sqlSession.selectOne("pay.sequence");
	}
	
	@Override
	public void ready(PayDto payDto) {
		sqlSession.insert("pay.ready", payDto);
	}
	
	@Override
	public void approve(int payNo) {
		sqlSession.update("pay.approve", payNo);
	}

	@Override
	public boolean plus(PayDto payDto) {
		 int count = sqlSession.update("pay.plus", payDto);
		 return count > 0;
	}
	
	
	@Override
	public PayDto get(int payNo) {
		return sqlSession.selectOne("pay.get", payNo);
	}
//	
//	@Override
//	public void cancel(int paymentNo) {
//		sqlSession.update("payment.cancel", paymentNo);
//	}
	
}