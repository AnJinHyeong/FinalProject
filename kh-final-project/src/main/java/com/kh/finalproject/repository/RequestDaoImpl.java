package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.entity.RequestReplyDto;
import com.kh.finalproject.vo.RequestReplyVo;
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

	@Override
	public void insertReply(RequestReplyDto requestReplyDto) {
		sqlSession.insert("request.insertReply", requestReplyDto);
	}

	@Override
	public List<RequestReplyVo> replyList(int requestReplyNo) {
		return sqlSession.selectList("request.replyList", requestReplyNo);
	}

	@Override
	public int replyCount(int requestReplyNo) {
		return sqlSession.selectOne("request.replyCount", requestReplyNo);
	}

	@Override
	public boolean deleteReply(int requestReplyPkNo) {
		int count = sqlSession.delete("request.deleteReply", requestReplyPkNo);
		return count > 0;
	}

	@Override
	public boolean likeCountUp(int requestNo) {
		int count = sqlSession.update("request.likeCountUp", requestNo);
		return count > 0;
	}

	@Override
	public boolean likeCountDown(int requestNo) {
		int count = sqlSession.update("request.likeCountDown", requestNo);
		return count > 0;
	}

	@Override
	public boolean replyCountUp(int requestNo) {
		int count = sqlSession.update("request.replyCountUp", requestNo);
		return count > 0;
	}

	@Override
	public boolean replyCountDown(int requestNo) {
		int count = sqlSession.update("request.replyCountDown", requestNo);
		return count > 0;
	}

	@Override
	public boolean viewCountUp(int requestNo) {
		int count = sqlSession.update("request.viewCountUp", requestNo);
		return count > 0;
	}

	@Override
	public List<RequestDto> selectLikeTop5() {
		return sqlSession.selectList("request.selectLikeTop5");
	}

	@Override
	public List<RequestDto> selectViewTop5() {
		return sqlSession.selectList("request.selectViewTop5");
	}

	@Override
	public List<RequestVo> requestSearch(String keyword) {
		return sqlSession.selectList("request.requestSearch", keyword);
	}
	
	
}
