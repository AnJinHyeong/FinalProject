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
	//프로젝트 대표 이미지 불러오기
	ImageDto getProjectMain(int imageNo);
	//프로젝트 대표 이미지 조회
	ImageDto getProjectMainByProjectNo(int projectNo);
	//프로젝트 이미지 확인 (1: 이미지 o / 0: 이미지 x)
	int confirmProjectMain(int projectNo);
	//프로젝트 이미지 삭제
	boolean deleteProjectMain(int projectNo);
	
	//창작자 프로핑 이미지 등록
	ImageDto insertMember(ImageDto imageDto);
	//창작자 이미지 조회
	ImageDto getByMemberNo(int memberNo);
	//프로젝트 이미지 확인 (1: 이미지 o / 0: 이미지 x)
	int confirmMember(int memberNO);
	//프로젝트 이미지 삭제
	boolean deleteMember(int memberNo);
	//이미지 불러오기
	ImageDto getImage(int imageNo);
	
	
}
