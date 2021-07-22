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
	public void plus(int payNo) {
		sqlSession.update("pay.plus", payNo);
		
	}

	@Override
	public void approve(int payNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean approve(PayDto payDto) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
//	
//	@Override
//	public List<PaymentDto> list(int paymentBuyer) {
//		return sqlSession.selectList("payment.list", paymentBuyer);
//	}
//	
//	@Override
//	public PayDto get(int payNo) {
//		return sqlSession.selectOne("pay.get", payNo);
//	}
//	
//	@Override
//	public void cancel(int paymentNo) {
//		sqlSession.update("payment.cancel", paymentNo);
//	}
	
}