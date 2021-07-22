package com.kh.finalproject.repository;

import java.io.IOException;
import java.util.List;

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
	
	// 프로젝트 스토리 이미지 등록
	ImageDto insertProjectMainStory(ImageDto imageDto, int projectNo, int i);
	// 프로젝트 스토리 이미지 이미지 번호로 뿔러오기
	ImageDto getProjectMainStoryByImageNo(int imageNo);
	// 프로젝트 스토리 이미지 저장 이름으로 뿔러오기
	ImageDto getImageByImageSaveName(String imageSaveName);
	// 프로젝트 스토리 이미지 갯수
	int getCountProjectStoryImage(int projectNo);
	// 프로젝트 스토리에서 List로 데이터 삭제
	void deleteProjectStoryNotCurrentImage(int projectNo, List<Integer> fileNoList);
	// 프로젝트 스토리 데이터 전부 삭제
	void deleteProjectStoryAllImage(int projectNo);
	// 이미지 저장 이름으로 이미지 삭제
	void deleteImageByImageSaveName(int projectNo, String imageSaveName);
	// 프로젝트 번호와 이미지 저장 이름으로 이미지 확인 (>1: 이미지 o / =0: 이미지 x)
	int confirmProjectMainStoryByImageSaveName(int projectNo, String imageSaveName);
}
