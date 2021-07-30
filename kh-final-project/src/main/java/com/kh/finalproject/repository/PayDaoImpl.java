package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PayDto;
import com.kh.finalproject.vo.Criteria;

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
	public boolean plus(PayDto payDto) {
		 int count = sqlSession.update("pay.plus", payDto);
		 return count > 0;
	}

	@Override
	public void approve(int payNo) {
		sqlSession.update("pay.approve", payNo);
	}

	@Override
	public PayDto get(int payNo) {
		return sqlSession.selectOne("pay.get", payNo);
	}

//	@Override
//	public List<PayDto> list(Criteria cri) {
//		  Map<String, Object> map = new HashMap<String, Object>();
//		  map.put("rowStart", cri.getRowStart());
//		  map.put("rowEnd", cri.getRowEnd());
////		  map.put("cri", cri);
//		return sqlSession.selectList("pay.list",map);
//	}

	@Override
	public List<PayDto> payList(int memberNo, Criteria cri) {
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("memberNo", memberNo);
		  map.put("rowStart", cri.getRowStart());
		  map.put("rowEnd", cri.getRowEnd());
		return sqlSession.selectList("pay.payList",map);
	}
	
	
	@Override
	public int listCount(int memberNo) {
		return sqlSession.selectOne("pay.listCount", memberNo);
	}
	
}