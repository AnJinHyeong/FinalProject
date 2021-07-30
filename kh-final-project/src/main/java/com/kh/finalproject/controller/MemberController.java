package com.kh.finalproject.controller;

import java.util.List;

import javax.mail.MessagingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.EmailAuthDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.entity.ProjectDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.repository.ProjectDao;
import com.kh.finalproject.service.EmailService;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MessageDao messageDao;
	@GetMapping("/testMsg")
	public String testMsg(HttpSession session,Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
	
		
	
		
		MemberDto mdb=memberDao.getByMemberNo(memberNo);
		model.addAttribute("memberDto",mdb);
		
		List<MessageDto> find = messageDao.msgAllByMemberNo(memberNo);

		model.addAttribute("messageDto", find);

		

		List<MessageDto> find2 = messageDao.msgReceiverByMemberNo(memberNo);

		model.addAttribute("messageDto2", find2);

		

		List<MessageDto> find3 = messageDao.msgSendByMemberNo(memberNo);

		model.addAttribute("messageDto3", find3);
		
		return "member/testMsg";
	}
	@RequestMapping("/redirectMember")
	public String redirectMember() {
		return "member/redirectMember";
	}
	@GetMapping("/mySettings")
	public String mySettings(HttpSession session,Model model) {
		
		int memberNo = (int) session.getAttribute("memberNo");
		MemberDto find = memberDao.getByMemberNo(memberNo);
		
		model.addAttribute("memberDto",find);
		return "member/mySettings";
	}
	@GetMapping("/myAccount")
	public String myAccount(HttpSession session,Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		MemberDto find = memberDao.getByMemberNo(memberNo);
		
		model.addAttribute("memberDto",find);

		return "member/myAccount";
	}
	@PostMapping("/upEmail")
	public String upEmail(HttpSession session,Model model,@ModelAttribute MemberDto memberDto) {
		int memberNo = (int) session.getAttribute("memberNo");
		memberDto.setMemberNo(memberNo);
		boolean upEmail=memberDao.updateEmail(memberDto);
		if(upEmail){
			model.addAttribute("msg","이메일 변경이 완료되었습니다.");
			model.addAttribute("url","/member/myAccount");
			
		}else	{
			model.addAttribute("msg","이메일 변경이 실패했습니다.");
			model.addAttribute("url","/member/myAccount");
		}
		return "member/redirectMember";
	}
	@PostMapping("/upIntro")
	public String upIntro(HttpSession session,Model model,@ModelAttribute MemberDto memberDto) {
		int memberNo = (int) session.getAttribute("memberNo");
		memberDto.setMemberNo(memberNo);
		boolean upIntro=memberDao.updateIntro(memberDto);
		if(upIntro){
			model.addAttribute("msg","소개글 변경이 완료되었습니다.");
			model.addAttribute("url","/member/mySettings");
			
		}else	{
			model.addAttribute("msg","소개글 변경이 실패했습니다.");
			model.addAttribute("url","/member/mySettings");
		}
		return "member/redirectMember";
	}
	@PostMapping("/upNick")
	public String upNick(HttpSession session,Model model,@ModelAttribute MemberDto memberDto) {
		int memberNo = (int) session.getAttribute("memberNo");
		memberDto.setMemberNo(memberNo);
		boolean upNick=memberDao.updateNick(memberDto);
		if(upNick){
			model.addAttribute("msg","닉네임 변경이 완료되었습니다.");
			model.addAttribute("url","/member/mySettings");
			
		}else	{
			model.addAttribute("msg","닉네임 변경이 실패했습니다.");
			model.addAttribute("url","/member/mySettings");
		}
		return "member/redirectMember";
	}
	@PostMapping("/upAddress")
	public String upAddress(HttpSession session,Model model,@ModelAttribute MemberDto memberDto) {
		int memberNo = (int) session.getAttribute("memberNo");
		memberDto.setMemberNo(memberNo);
		boolean upAddress=memberDao.updateAddress(memberDto);
		if(upAddress){
			model.addAttribute("msg","주소 변경이 완료되었습니다.");
			model.addAttribute("url","/member/myAccount");
			
		}else	{
			model.addAttribute("msg","주소 변경이 실패했습니다.");
			model.addAttribute("url","/member/myAccount");
		}
		return "member/redirectMember";
	}
	@PostMapping("/upPw2")
	public String upPw2(HttpSession session,Model model,@ModelAttribute MemberDto memberDto){
		
		int memberNo = (int)session.getAttribute("memberNo");
		memberDto.setMemberNo(memberNo);
		memberDao.changePassword(memberDto);
		try{
			model.addAttribute("msg","비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
			model.addAttribute("url","/member/logout");
			
		}catch(Exception e)	{
			model.addAttribute("msg","비밀번호 변경이 실패했습니다.");
			model.addAttribute("url","/member/myAccount");
		}
		return "member/redirectMember";
	}
	@GetMapping("/myAddress")
	public String myAddress(HttpSession session,Model model) {
		int memberNo = (int) session.getAttribute("memberNo");
		MemberDto find = memberDao.getByMemberNo(memberNo);
		
		model.addAttribute("memberDto",find);
		return "member/myAddress";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	@RequestMapping("/myPage")
	public String myPage() {
		return "member/myPage";
	}

	
	@RequestMapping(value="/myMsg" , method = {RequestMethod.GET, RequestMethod.POST})
	public String myMsg(HttpSession session,Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		List<MessageDto> find = messageDao.msgAllByMemberNo(memberNo);

		model.addAttribute("messageDto", find);

		

		List<MessageDto> find2 = messageDao.msgReceiverByMemberNo(memberNo);

		model.addAttribute("messageDto2", find2);

		

		List<MessageDto> find3 = messageDao.msgSendByMemberNo(memberNo);

		model.addAttribute("messageDto3", find3);

		return "member/myMsg";
	} 

	@RequestMapping("/myId")
	public String myId() {
		return "member/myId";
	}
	@RequestMapping("/addressInsert")
	public String addressInsert() {
		return "member/addressInsert";
	}
	@GetMapping("/{projectNo}/msgWrite")
	public String msgWrite(@PathVariable int projectNo, Model model){
		ProjectDto projectDto = projectDao.getByProjectNo(projectNo);
		model.addAttribute("projectDto", projectDto);
		return "member/msgWrite";
	}

	@PostMapping("/{projectNo}/msgInsert")
	public String msgInsert(@PathVariable int projectNo,@ModelAttribute MessageDto messageDto,Model model,HttpSession session) throws Exception{
		
		int senderNo = (int)session.getAttribute("memberNo");
		messageDto.setSenderNo(senderNo);
		messageDao.msgWrite2(messageDto);
		try {
			model.addAttribute("msg","쪽지가 발송되었습니다.");
			model.addAttribute("url","/");
			
		}catch(Exception e) {
			model.addAttribute("msg","쪽지가 발송이 실패했습니다.");
			model.addAttribute("url","/");
		}
		return "member/redirectMember";
	}

	@PostMapping(value = "/memberInsert")
	public String memberInsert(@ModelAttribute EmailAuthDto emailAuthDto, RedirectAttributes attr,@ModelAttribute MemberDto memberDto) {
	boolean result = emailService.checkCertification(emailAuthDto);
	if(result) {
		memberDao.memberInsert(memberDto);
		return "member/joinSuccess";
	}else {
		attr.addAttribute("error", "");
		attr.addAttribute("email", emailAuthDto.getEmail());
		return "redirect:join";
	}	
	}
	 
	@GetMapping("/login")
	public String memberInsert() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto find = memberDao.login(memberDto);
		if(find != null) {
			session.setAttribute("memberNo", find.getMemberNo());
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
			session.removeAttribute("memberNo");
			
			return "redirect:/";
	}

	@Autowired
	private ProjectDao projectDao;
	

	@GetMapping("/myProject")
	public String myProject(
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		List<ProjectDto> projectDto = projectDao.proList(memberNo);
		model.addAttribute("projectDto", projectDto);
		
		return "member/myProject";
	}
	
	@GetMapping("/myMsg2")

	public String myMsg2(HttpSession session,Model model) {

		int memberNo = (int)session.getAttribute("memberNo");

		

		List<MessageDto> find = messageDao.msgAllByMemberNo(memberNo);

		model.addAttribute("messageDto", find);

		

		List<MessageDto> find2 = messageDao.msgReceiverByMemberNo(memberNo);

		model.addAttribute("messageDto2", find2);

		

		List<MessageDto> find3 = messageDao.msgSendByMemberNo(memberNo);

		model.addAttribute("messageDto3", find3);

		return "member/myMsg2";

		

	}
	
	@GetMapping("/myProject2")
	public String myProject2(
			HttpSession session,
			Model model) {
		int memberNo = (int)session.getAttribute("memberNo");
		List<ProjectDto> find = projectDao.proList2(memberNo);
		model.addAttribute("projectDto", find);
		
		return "member/myProject2";
	}
	
	@GetMapping("/myPw")
	public String emailPw() {
		return "member/myPw";
	}
	
	@PostMapping("/getPw")
	public String getPw(@RequestParam String memberEmail, Model model) throws MessagingException {
		emailService.sendPwEmail(memberEmail);
		try {
		model.addAttribute("msg","이메일이 발송되었습니다.");
		model.addAttribute("url","/member/login");
		}
		catch(Exception e){
			model.addAttribute("msg","이메일이 잘못되었습니다.");
			model.addAttribute("url","/member/myPw");
		}
		return "member/redirectMember";
	}

		
	@GetMapping("/emailCheck")
	public String emailCheck() {
		return "member/emailCheck";
	}
	
	@PostMapping("/emailCheck")
	public String emailCheck(@RequestParam String email, RedirectAttributes attr) throws MessagingException {
		emailService.sendEmail(email);
		
		attr.addAttribute("email", email);
		return "redirect:join";
	}
	

	@PostMapping("/getId")
	public String getId(@RequestParam String memberEmail, Model model){
		MemberDto findId = memberDao.getByMemberEmail(memberEmail);
		
		
		if(findId ==null) {
			model.addAttribute("msg","아이디가 없습니다."); 
			model.addAttribute("url","/member/myId");
		}
		else {
			model.addAttribute("msg","고객님의 아이디는 "+findId.getMemberId()+"입니다.");
			model.addAttribute("url","/member/login");
		}
		
		return "member/redirectMember";
		
	}


}
