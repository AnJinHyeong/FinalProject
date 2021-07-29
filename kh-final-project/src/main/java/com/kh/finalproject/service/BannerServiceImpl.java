package com.kh.finalproject.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.entity.ImageDto;
import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.ImageDao;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerDao bannerDao;

	@Autowired
	private ImageDao imageDao;

	@Override
	@Transactional
	public void insertMainBanner(BannerDto bannerDto, MultipartFile bannerImage) throws IllegalStateException, IOException {
		
		int bannerNo = bannerDao.getSequence();
		
		int imageNo = imageDao.getSequence();
		
		bannerDto.setBannerNo(bannerNo);
		
		bannerDao.insertBannerBySequence(bannerDto);

		if (!bannerImage.isEmpty()) {

			File dir = new File("D:/upload/finalproject");
			dir.mkdirs();
			String fileName = String.valueOf(imageNo);
			File target = new File(dir, fileName);
			bannerImage.transferTo(target);

			ImageDto imageDto = ImageDto.builder()
					.imageNo(imageNo)
					.imageUploadName(bannerImage.getOriginalFilename())
					.imageSaveName(fileName)
					.imageContentType(bannerImage.getContentType())
					.imageSize(bannerImage.getSize())
					.mainBanner(bannerNo)
					.build();
			imageDao.insertImageMainBanner(imageDto);
		}

	}
}
