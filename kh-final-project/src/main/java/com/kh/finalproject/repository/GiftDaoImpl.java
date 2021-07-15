package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.GiftDto;
import com.kh.finalproject.vo.GiftItemVo;
import com.kh.finalproject.vo.ItemListVo;

@Repository
public class GiftDaoImpl implements GiftDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(GiftDto giftDto) {
		sqlSession.insert("gift.insert", giftDto);
	}

	@Override
	public List<GiftDto> listByProjectNo(int projectNo) {
		return sqlSession.selectList("gift.listByProjectNo", projectNo);
	}

	@Override
	public int count(int projectNo) {
		return sqlSession.selectOne("gift.count", projectNo);
	}

	@Override
	public void delete(int giftNo) {
		sqlSession.delete("gift.delete", giftNo);
	}

	@Override
	public int getSequence() {
		return sqlSession.selectOne("gift.getSequence");
	}

	@Override
	public void insertBySequence(GiftDto giftDto) {
		sqlSession.insert("gift.insertBySequence", giftDto);
	}

	// giftItem에 데이터 입력 반복문
	@Override
	public void insert(List<ItemListVo> itemList, int giftNo) {
		for (int i = 0; i < itemList.size(); i++) {
			itemList.get(i).setGiftNo(giftNo);
			sqlSession.insert("giftItem.insert", itemList.get(i));
		}
	}

	// giftItem에서 GiftItemVo 형식으로 데이터 리스트 불러오기
	@Override
	public List<GiftItemVo> list() {
		return sqlSession.selectList("giftItem.list");
	}
	
	

}
