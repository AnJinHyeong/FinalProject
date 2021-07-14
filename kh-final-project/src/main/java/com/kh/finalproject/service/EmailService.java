package com.kh.finalproject.service;

import javax.mail.MessagingException;

public interface EmailService {

	void sendEmail(String email) throws MessagingException;
}
