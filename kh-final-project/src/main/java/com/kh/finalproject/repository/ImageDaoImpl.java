package com.kh.finalproject.repository;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.ImageDto;

@Repository
public class ImageDaoImpl implements ImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	private final File baseDir = new File("/Users/anjinhyeong/sts-workspace/upload/project_image");//저장 경로 //안진형
//	private final File baseDir = new File("경로 적어주세요.");//저장 경로
	
	@Override
	public ImageDto insertProjectMain(ImageDto imageDto) {
		int profileNo = sqlSession.selectOne("imageFile.sequence");
		imageDto.setImageNo(profileNo);
		imageDto.setImageSaveName(String.valueOf(profileNo));

		sqlSession.insert("imageFile.insertProjectMain",imageDto);
		
		return imageDto;
	}
	
	@Override
	public void save(String fileName, MultipartFile file) throws IllegalStateException, IOException {
		File target = new File(baseDir,fileName);
		file.transferTo(target);
	}
	
	@Override
	public ImageDto getProjectMain(int imageNo) {
		return sqlSession.selectOne("imageFile.getProjectMain", imageNo);
	}

	@Override
	public ByteArrayResource getFile(String fileName) throws IOException {
		File target = new File(baseDir, fileName);
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		return resource;
	}

	@Override
	public ImageDto getProjectMainByProjectNo(int projectNo) {
		return sqlSession.selectOne("imageFile.getProjectMainByProjectNo", projectNo);
	}

	@Override
	public int confirmProjectMain(int projectNo) {
		return sqlSession.selectOne("imageFile.confirmProjectMain", projectNo);
	}

	@Override
	public boolean deleteProjectMain(int projectNo) {
		int count = sqlSession.delete("imageFile.deleteProjectMain",projectNo);
		return count > 0;
	}
	
	
	
}
