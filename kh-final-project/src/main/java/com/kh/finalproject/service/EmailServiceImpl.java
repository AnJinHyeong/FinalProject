package com.kh.finalproject.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.entity.EmailAuthDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.EmailAuthDao;
import com.kh.finalproject.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailServiceImpl implements EmailService{
	
		
		
	
	@Autowired
	private JavaMailSender sender;
	
	
	@Autowired
	private EmailAuthDao emailAuthDao;
	
	@Autowired
	private MemberDao memberDao;

	
	@Autowired
	private RandomService randomService;

	@Override
	@Transactional
	public void sendEmail(String email) throws MessagingException {
		
		String no = randomService.randomAuth(3);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message,false,"UTF-8");
		
		helper.setFrom("final9595start@gmail.com");
		helper.setTo(email);
		helper.setSubject("[Fun_ding] 회원가입 인증번호 메일입니다.");
		helper.setText("안녕하세요 [Fun_ding] 회원가입 해주셔서 감사합니다.");
		helper.setText("인증번호: "+no);
		
		emailAuthDao.insert(EmailAuthDto.builder().email(email).no(no).build());
		sender.send(message);
		
	}
	@Override
	public void sendPwEmail(String memberEmail) throws MessagingException {
		String memberPw = randomService.randomAuth(3);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message,false,"UTF-8");
		
		helper.setFrom("final9595start@gmail.com");
		helper.setTo(memberEmail);
		helper.setSubject("[Fun_ding] 임시 비밀번호발급 메일입니다.");
		helper.setText("임시비밀번호:"+memberPw);
		
		memberDao.updatePw(MemberDto.builder().memberPw(memberPw).memberEmail(memberEmail).build());
		sender.send(message);
	}
	
	
	@Override
	@Transactional
	public boolean checkCertification(EmailAuthDto emailAuthDto) {
		boolean result = emailAuthDao.check(emailAuthDto);
		if(result) {
			emailAuthDao.deleteByEmail(emailAuthDto.getEmail());
		}
		return result;
	}
	
	@Scheduled(cron = "0 0 * * * *")
	@Override
	public void clearCertification() {
		emailAuthDao.clear();
		log.debug("인증정보 테이블 청소가 완료되었습니다");
		
	}


}	