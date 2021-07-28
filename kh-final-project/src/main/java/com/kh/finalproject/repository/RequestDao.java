package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.RequestDto;
import com.kh.finalproject.entity.RequestReplyDto;
import com.kh.finalproject.vo.RequestReplyVo;
import com.kh.finalproject.vo.RequestVo;

public interface RequestDao {

	//게시글 등록
	void insert(RequestDto requestDto);
	//게시글 전체 조회
	List<RequestVo> selectAll();
	//게시글 번호로 게시글 상세조회
	RequestVo getByRequestNo(int requestNo);
	//게시글 댓글 등록
	void insertReply(RequestReplyDto requestReplyDto);
	//게시글 댓글 리스트
	List<RequestReplyVo> replyList(int requestReplyNo);
	//게시글 댓글 개수
	int replyCount(int requestReplyNo);
	//게시글 댓글 삭제
	boolean deleteReply(int requestReplyPkNo);
	//좋아요 카운트 +1
	boolean likeCountUp(int requestNo);
	//좋아요 카운트 -1
	boolean likeCountDown(int requestNo);
	//댓글 카운트 +1
	boolean replyCountUp(int requestNo);
	//댓글 카운트 -1
	boolean replyCountDown(int requestNo);
	//게시들 조회수 증가
	boolean viewCountUp(int requestNo);
	//좋아요 TOP5 조회
	List<RequestDto> selectLikeTop5();
	//조회순 TOP5 조회
	List<RequestDto> selectViewTop5();
	//게시글 제목 검색
	List<RequestVo> requestSearch(String keyword);
	
	
}
