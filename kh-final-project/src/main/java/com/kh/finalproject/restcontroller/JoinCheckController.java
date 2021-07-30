package com.kh.finalproject.restcontroller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/check")
public class JoinCheckController {
	   @Autowired
	    private JavaMailSender mailSender;
	   
	@Autowired
	MemberDao memberDao;
	
	@GetMapping("/id")
	public String checkId(@RequestParam String memberId){
		if(memberDao.checkId(memberId)) return "N";
			else return "Y";
	}
	
	@GetMapping("/email")
	public String checkEmail(@RequestParam String memberEmail) {
		if(memberDao.checkEmail(memberEmail)) return "NoEmail";
		else return "Yes";
	}
	
	@GetMapping("/emailKey")
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
//        인증번호(난수) 생성
	Random random = new Random();
	int checkNum = random.nextInt(888888) + 11111111;
	log.info("인증번호" + checkNum);
	
	 /* 이메일 보내기 */
    String setFrom = "fun_dingCorp@master.com";
    String toMail = email;
    String title = "회원가입 인증 이메일 입니다.";
    String content = 
            "fun_ding을 방문해주셔서 감사합니다." +
            "<br>" + 
            "인증 번호는 다음과 같습니다." +"<strong>"+
            "<br><br>" + 
            checkNum +"</strong>"+
            "<br><br>" +
            "해당 인증번호를 회원가입 인증번호란에 기입하여 주세요.";
    try {
        
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content,true);
        mailSender.send(message);
        
    }catch(Exception e) {
        e.printStackTrace();
    }
    
    String num = Integer.toString(checkNum);
    return num;
	}
	

}
