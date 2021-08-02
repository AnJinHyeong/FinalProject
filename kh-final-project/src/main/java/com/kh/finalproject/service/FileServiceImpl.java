package com.kh.finalproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.repository.ImageDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class FileServiceImpl implements FileService {

	@Autowired
	private ImageDao imageDao;

	@Override
	public void deleteLocalFileNotInDB() {
//		@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String path = "/Users/anjinhyeong/sts-workspace/upload/project_image";
//		String path = "D:/upload/finalproject/";

		File saveFileList = new File(path);

		File[] fileList = saveFileList.listFiles();
		List<String> fileSaveNameList = new ArrayList<>();

		for (File file : fileList) {
			fileSaveNameList.add(file.getName());
		}

		fileSaveNameList.removeAll(imageDao.getImageSaveNameList());

		for (int i = 0; i < fileSaveNameList.size(); i++) {
			File targetFile = new File(path + fileSaveNameList.get(i));
			if (targetFile.exists() && targetFile.isFile()) {
				targetFile.delete();
			}
		}
	}
	
	public void test() {
		log.debug("로컬 파일 정리가 완료되었습니다. test");
	}
	
	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void autoClearDeleteLocalFileNotInDB() {
		test();
//		deleteLocalFileNotInDB();
	}

}
