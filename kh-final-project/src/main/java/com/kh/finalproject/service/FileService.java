package com.kh.finalproject.service;

public interface FileService {

	void deleteLocalFileNotInDB();
	
	void autoClearDeleteLocalFileNotInDB();
}
