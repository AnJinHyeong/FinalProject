package com.kh.finalproject.repository;

import com.kh.finalproject.entity.SponsorDto;

public interface SponsorDao {
	// 후원 등록
	void insert(SponsorDto sponsorDto);
}
