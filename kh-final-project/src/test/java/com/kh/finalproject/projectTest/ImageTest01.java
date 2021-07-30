package com.kh.finalproject.projectTest;

import java.io.IOException;
import java.net.URLEncoder;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.entity.ImageDto;
import com.kh.finalproject.repository.ImageDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class ImageTest01 {

	@Autowired
	private ImageDao imageDao;
	
	@Test
	public void test() throws IOException {
		int imageNo = 777;
		
		ImageDto imageDto = imageDao.getImageMainBanner(imageNo); 
		ByteArrayResource resource = imageDao.getFile(imageDto.getImageSaveName());
		String fileName = URLEncoder.encode(imageDto.getImageUploadName(), "UTF-8");

		log.info(ResponseEntity.ok()
								.contentType(MediaType.APPLICATION_OCTET_STREAM)
								.contentLength(imageDto.getImageSize())
								.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
								.header(HttpHeaders.CONTENT_DISPOSITION, 
										"attachment; filename=\""+fileName+"\"")
								.body(resource).toString());
	}
}
