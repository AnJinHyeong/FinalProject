package com.kh.finalproject.projectTest;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.finalproject.repository.ImageDao;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Slf4j
public class FileDeleteTest01 {

	@Autowired
	private ImageDao imageDao;
	
	@Test
	public void test() {
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String path = "D:/upload/finalproject/";
		
		File saveFileList = new File(path);
		
		File[] fileList = saveFileList.listFiles();
		List<String> fileSaveNameList = new ArrayList<>();
		
		for(File file : fileList) {
			fileSaveNameList.add(file.getName());
		}
		
		fileSaveNameList.removeAll(imageDao.getImageSaveNameList());
		
		for(int i = 0 ; i < fileSaveNameList.size() ; i++) {
			File targetFile = new File(path + fileSaveNameList.get(i));
			if(targetFile.exists() && targetFile.isFile()) {
				targetFile.delete();
			}
		}
	}
	
}
