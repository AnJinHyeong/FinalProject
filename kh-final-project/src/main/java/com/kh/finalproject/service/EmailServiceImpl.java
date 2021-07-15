package com.kh.finalproject.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService{
	@Override
	public void sendEmail(String email) throws MessagingException {
		// TODO Auto-generated method stub
		
	}
	
//	@Autowired
//	private JavaMailSender sender;
//	
//
//	
//	@Autowired
//	private RandomService randomService;
//
//	@Override
//	@Transactional
//	public void sendEmail(String email) throws MessagingException {
//		
//		String no = randomService.randomAuth(3);
//		
//		MimeMessage message = sender.createMimeMessage();
//		MimeMessageHelper helper = new MimeMessageHelper(message,false,"UTF-8");
//		
//		helper.setFrom("semi210604@gmail.com");
//		helper.setTo(email);
//		helper.setSubject("[Fun_ding] 회원가입 인증번호 메일입니다.");
//		helper.setText("인증번호: "+no);
//		
////		emailAuthDao.insert(EmailAuthDto.builder()
////				.auth_key(no)
////				.build());
//		sender.send(message);
//		
//	}

}