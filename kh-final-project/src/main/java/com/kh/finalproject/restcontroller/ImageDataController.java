package com.kh.finalproject.restcontroller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.ImageDto;
import com.kh.finalproject.repository.ImageDao;

@RequestMapping("/image")
@RestController
public class ImageDataController {
	
	@Autowired
	private ImageDao imageDao;
	
	
	@PostMapping("/project/upload/{projectNo}")
	public ImageDto upload(@PathVariable int projectNo, @RequestParam MultipartFile f) throws IllegalStateException, IOException {
		ImageDto imageDto = ImageDto.builder()
				.imageUploadName(f.getOriginalFilename())
				.imageContentType(f.getContentType())
				.imageSize(f.getSize())
				.projectNo(projectNo)
				.build();
		
		ImageDto result = imageDao.insertProjectMain(imageDto);
		
		imageDao.save(imageDto.getImageSaveName(), f);
		return result;
	}
	
	@GetMapping("/project/projectMainDownload/{imageNo}")
	public ResponseEntity<ByteArrayResource> projectMainDownload(@PathVariable int imageNo) throws IOException {
		
		ImageDto imageDto = imageDao.getProjectMain(imageNo); 
		ByteArrayResource resource = imageDao.getFile(imageDto.getImageSaveName());
		String fileName = URLEncoder.encode(imageDto.getImageUploadName(), "UTF-8");

		return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(imageDto.getImageSize())
								.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION, 
										"attachment; filename=\""+fileName+"\"")
								.body(resource);
	}
	
	@GetMapping("/project/getByProjectNo/{projectNo}")
	public ImageDto getByProjectNo(@PathVariable int projectNo) throws IOException {
		ImageDto imageDto = imageDao.getProjectMainByProjectNo(projectNo); 
		return imageDto;
	}
	
	@PostMapping("/project/confirm/{projectNo}")
	public int confirm(@PathVariable int projectNo) {
		return imageDao.confirmProjectMain(projectNo);
	}
	
	@PostMapping("/project/delete/{projectNo}")
	public void delete(@PathVariable int projectNo) {
		imageDao.deleteProjectMain(projectNo);
	}
	
	
	
	//회원 프로필 설정
	@PostMapping("/member/upload")
	public ImageDto uploadMember(HttpSession session, @RequestParam MultipartFile f) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("memberNo");
		ImageDto imageDto = ImageDto.builder()
				.imageUploadName(f.getOriginalFilename())
				.imageContentType(f.getContentType())
				.imageSize(f.getSize())
				.memberNo(memberNo)
				.build();
		
		ImageDto result = imageDao.insertMember(imageDto);
		
		imageDao.save(imageDto.getImageSaveName(), f);
		return result;
	}
	
	@GetMapping("/member/memberDownload/{imageNo}")
	public ResponseEntity<ByteArrayResource> memberDownload(@PathVariable int imageNo) throws IOException {
		
		ImageDto imageDto = imageDao.getImage(imageNo); 
		ByteArrayResource resource = imageDao.getFile(imageDto.getImageSaveName());
		String fileName = URLEncoder.encode(imageDto.getImageUploadName(), "UTF-8");

		return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(imageDto.getImageSize())
								.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION, 
										"attachment; filename=\""+fileName+"\"")
								.body(resource);
	}
	
	@GetMapping("/member/getByMemberNo")
	public ImageDto getByMemberNo(HttpSession session) throws IOException {
		int memberNo = (int)session.getAttribute("memberNo");
		ImageDto imageDto = imageDao.getByMemberNo(memberNo); 
		return imageDto;
	}
	
	@PostMapping("/member/confirm")
	public int confirmMember(HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		return imageDao.confirmMember(memberNo);
	}
	
	@PostMapping("/member/delete")
	public void delete(HttpSession session) {
		int memberNo = (int)session.getAttribute("memberNo");
		imageDao.deleteMember(memberNo);
	}
	
	@PostMapping("/project/upload/story/{projectNo}")
	public ImageDto uploadStory(@PathVariable int projectNo, @RequestParam MultipartFile f) throws IllegalStateException, IOException {
		ImageDto imageDto = ImageDto.builder()
				.imageUploadName(f.getOriginalFilename())
				.imageContentType(f.getContentType())
				.imageSize(f.getSize())
				.projectNo(projectNo)
				.build();
		
		ImageDto result = imageDao.insertProjectMainStory(imageDto);
		
		imageDao.save(imageDto.getImageSaveName(), f);
		return result;
	}
	
	@GetMapping("/project/download/story/{imageNo}")
	public ResponseEntity<ByteArrayResource> downloadStory(@PathVariable int imageNo) throws IOException {
		ImageDto imageDto = imageDao.getProjectMainStory(imageNo); 
		ByteArrayResource resource = imageDao.getFile(imageDto.getImageSaveName());
		String fileName = URLEncoder.encode(imageDto.getImageUploadName(), "UTF-8");

		return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(imageDto.getImageSize())
								.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION, 
										"attachment; filename=\""+fileName+"\"")
								.body(resource);
	}
	
	
}