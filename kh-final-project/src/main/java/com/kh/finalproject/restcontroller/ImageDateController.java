package com.kh.finalproject.restcontroller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

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
public class ImageDateController {
	
	@Autowired
	private ImageDao projectImageDao;
	
	
	@PostMapping("/project/upload/{projectNo}")
	public ImageDto upload(@PathVariable int projectNo, @RequestParam MultipartFile f) throws IllegalStateException, IOException {
		ImageDto imageDto = ImageDto.builder()
				.imageUploadName(f.getOriginalFilename())
				.imageContentType(f.getContentType())
				.imageSize(f.getSize())
				.projectNo(projectNo)
				.build();
		
		ImageDto result = projectImageDao.insertProjectMain(imageDto);
		
		projectImageDao.save(imageDto.getImageSaveName(), f);
		return result;
	}
	
	@GetMapping("/project/download/{imageNo}")
	public ResponseEntity<ByteArrayResource> download(@PathVariable int imageNo) throws IOException {
		
		ImageDto imageDto = projectImageDao.getProjectMain(imageNo); 
		ByteArrayResource resource = projectImageDao.getFile(imageDto.getImageSaveName());
		String fileName = URLEncoder.encode(imageDto.getImageUploadName(), "UTF-8");

		return ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(imageDto.getImageSize())
								.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION, 
										"attachment; filename=\""+fileName+"\"")
								.body(resource);
	}
	
	@GetMapping("/project/getByProject/{projectNo}")
	public ImageDto getByProject(@PathVariable int projectNo) throws IOException {
		ImageDto projectImageDto = projectImageDao.getProjectMainByProjectNo(projectNo); 
		return projectImageDto;
	}
	
	@PostMapping("/project/confirm/{projectNo}")
	public int confirm(@PathVariable int projectNo) {
		return projectImageDao.confirmProjectMain(projectNo);
	}
	
	@PostMapping("/project/delete/{projectNo}")
	public void delete(@PathVariable int projectNo) {
		projectImageDao.deleteProjectMain(projectNo);
	}
	
}
