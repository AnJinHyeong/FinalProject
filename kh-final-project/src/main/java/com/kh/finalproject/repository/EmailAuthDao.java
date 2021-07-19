package com.kh.finalproject.repository;

import com.kh.finalproject.entity.EmailAuthDto;

public interface EmailAuthDao {
	void insert(EmailAuthDto emailAuthDto);
	boolean check(EmailAuthDto emailAuthDto);
	void deleteByEmail(String email);
	void clear();
}
