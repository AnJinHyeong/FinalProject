package com.kh.finalproject.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.entity.BannerDto;
import com.kh.finalproject.entity.ImageDto;
import com.kh.finalproject.repository.BannerDao;
import com.kh.finalproject.repository.ImageDao;
import com.kh.finalproject.vo.BannerVo;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerDao bannerDao;

	@Autowired
	private ImageDao imageDao;

	@Override
	@Transactional
	public void insertMainBanner(BannerVo bannerVo) throws IllegalStateException, IOException {
		
		int bannerNo = bannerDao.getSequence();
		
		int imageNo = imageDao.getSequence();
		
		bannerVo.setBannerNo(bannerNo);
		
		bannerDao.insertBannerBySequence(BannerDto.builder()
										.bannerNo(bannerNo)
										.bannerTitle(bannerVo.getBannerTitle())
										.bannerContent(bannerVo.getBannerContent())
										.bannerBackgroundColor(bannerVo.getBannerBackgroundColor())
										.bannerColor(bannerVo.getBannerColor())
										.build());

//		File dir = new File("D:/upload/finalproject");
		File dir = new File("/Users/anjinhyeong/sts-workspace/upload/project_image");

		dir.mkdirs();
		String fileName = String.valueOf(imageNo);
		File target = new File(dir, fileName);
		bannerVo.getBannerImage().transferTo(target);

		ImageDto imageDto = ImageDto.builder()
				.imageNo(imageNo)
				.imageUploadName(bannerVo.getBannerImage().getOriginalFilename())
				.imageSaveName(fileName)
				.imageContentType(bannerVo.getBannerImage().getContentType())
				.imageSize(bannerVo.getBannerImage().getSize())
				.mainBanner(bannerNo)
				.build();
		imageDao.insertImageMainBanner(imageDto);

	}

	@Override
	@Transactional
	public void deleteMainBanner(BannerVo bannerVo) {
		
		imageDao.deleteImageByImageNo(bannerVo.getBannerImageNo());
		bannerDao.deleteBannerByBannerNo(bannerVo.getBannerNo());
		
	}
}
