package com.kh.finalproject.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	private final File baseDir = new File("/Users/anjinhyeong/sts-workspace/upload/project_image");//저장 경로 //안진형
	private final File baseDir = new File("D:/upload/finalproject");//저장 경로
	
	@Override
	public ImageDto insertProjectMain(ImageDto imageDto) {
		int imageNo = sqlSession.selectOne("imageFile.sequence");
		imageDto.setImageNo(imageNo);
		imageDto.setImageSaveName(String.valueOf(imageNo));

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

	@Override
	public ImageDto insertMember(ImageDto imageDto) {
		int imageNo = sqlSession.selectOne("imageFile.sequence");
		imageDto.setImageNo(imageNo);
		imageDto.setImageSaveName(String.valueOf(imageNo));

		sqlSession.insert("imageFile.insertMember",imageDto);
		
		return imageDto;
	}

	@Override
	public ImageDto getByMemberNo(int memberNo) {
		return sqlSession.selectOne("imageFile.getByMemberNo", memberNo);
	}
	
	@Override
	public ImageDto insertProjectMainStory(ImageDto imageDto, int projectNo, int i) {
		int imageNo = sqlSession.selectOne("imageFile.sequence");
		imageDto.setImageNo(imageNo);
		imageDto.setImageSaveName(String.valueOf(projectNo) + "(" + i + ")");

		sqlSession.insert("imageFile.insertProjectMainStory",imageDto);
		
		return imageDto;
	}

	
	@Override
	public int confirmMember(int memberNo) {
		return sqlSession.selectOne("imageFile.confirmMember", memberNo);
	}
	
	@Override
	public boolean deleteMember(int memberNo) {
		int count = sqlSession.delete("imageFile.deleteMember",memberNo);
		return count > 0;
	}
	
	@Override
	public ImageDto getImage(int imageNo) {
		return sqlSession.selectOne("imageFile.getImage", imageNo);
	}
	
	public ImageDto getProjectMainStory(int imageNo) {
		return sqlSession.selectOne("imageFile.getImage", imageNo);
	}

	@Override
	public int getCountProjectStoryImage(int projectNo) {
		return sqlSession.selectOne("imageFile.getCountProjectStoryImage", projectNo);
	}

	@Override
	public void deleteProjectStoryNotCurrentImage(int projectNo, List<Integer> fileNoList) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("fileNoList", fileNoList);
		sqlSession.delete("imageFile.deleteProjectStoryNotCurrentImage", map);
		
	}

	@Override
	public void deleteProjectStoryAllImage(int projectNo) {
		sqlSession.delete("imageFile.deleteProjectStoryAllImage", projectNo);
	}
	
}
