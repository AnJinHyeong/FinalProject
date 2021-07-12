package com.kh.finalproject.service;

import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class RandomServiceImpl implements RandomService{

	@Override
	public String randomAuth(int size) {
		Random r = new Random();
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0; i<size;i++) {
			int index = r.nextInt(25)+65;
			buffer.append(index);
			
		}
		
		for(int i=0; i < size; i++) {
			int numIndex = r.nextInt(10);
			buffer.append(numIndex);
		}
		
		
		return buffer.toString();
	}

}
