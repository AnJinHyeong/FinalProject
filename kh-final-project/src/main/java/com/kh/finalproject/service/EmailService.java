package com.kh.finalproject.service;

import javax.mail.MessagingException;

import com.kh.finalproject.entity.EmailAuthDto;

public interface EmailService {

	void sendEmail(String email) throws MessagingException;
	boolean checkCertification(EmailAuthDto emailAuthDto);
	void clearCertification();
	
}
