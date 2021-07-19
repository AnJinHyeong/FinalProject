package com.kh.finalproject.repository;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.ImageDto;

public interface ImageDao {

	//프로젝트 대표 이미지 등록
	ImageDto insertProjectMain(ImageDto imageDto);
	//이미지 폴더 저장
	void save(String fileName,MultipartFile file) throws IllegalStateException, IOException;
	//
	ByteArrayResource getFile(String fileName) throws IOException;
	//이미지 뿔러오기
	ImageDto getProjectMain(int imageNo);
	//프로젝트 대표 이미지 조회
	ImageDto getProjectMainByProjectNo(int projectNo);
	//프로젝트 이미지 확인 (1: 이미지 o / 0: 이미지 x)
	int confirmProjectMain(int projectNo);
	//프로젝트 이미지 삭제
	boolean deleteProjectMain(int projectNo);
	
	// 프로젝트 스토리 이미지 등록
	ImageDto insertProjectMainStory(ImageDto imageDto);
	// 프로젝트 스토리 이미지 뿔러오기
	ImageDto getProjectMainStory(int imageNo);
}
