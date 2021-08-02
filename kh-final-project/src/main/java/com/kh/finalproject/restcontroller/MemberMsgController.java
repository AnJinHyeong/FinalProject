package com.kh.finalproject.restcontroller;


import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MessageDto;

import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.vo.MsgVo;



@RequestMapping("/member/data")
@RestController
public class MemberMsgController {

	@Autowired
	private MessageDao messageDao; 
	
	@PostMapping("/messageList/{index}")
	public List<MessageDto> approveCheck(HttpSession session, @PathVariable int index){
		int memberNo = (int)session.getAttribute("memberNo");
		if(index == 0) {
			return messageDao.msgAllByMemberNo(memberNo);
		}
		else if(index == 1){
			return messageDao.msgReceiverByMemberNo(memberNo);
		}
		else {
			return messageDao.msgSendByMemberNo(memberNo);
		}
	}
	
	@PostMapping("/msgInformation")
	public MsgVo msgInformation(HttpSession session, @RequestParam int msgNo,Model model, Locale locale)
	{
		MsgVo msgVo = messageDao.getByMsgNo2(msgNo);
		return MsgVo.builder()
				.msgNo(msgNo)
				.msgTitle(msgVo.getMsgTitle())
				.msgDate(msgVo.getMsgDate())
				.receiverNo(msgVo.getReceiverNo())
				.msgContent(msgVo.getMsgContent())
				.senderNo(msgVo.getSenderNo())
				.build();
	} 
	@PostMapping("/{msgNo}/deleteMsg")
	public String deleteMsg(HttpSession session,@PathVariable int msgNo,Model model) {
		 
		MessageDto messageDto = MessageDto.builder()
				.msgNo(msgNo)
				.build();
		
		boolean deleteM = messageDao.deleteMsg(messageDto);
		if(deleteM){
			model.addAttribute("msg","메시지 삭제가 완료되었습니다.");
			model.addAttribute("url","/member/closeMember");
			
		}else	{
			model.addAttribute("msg","메시지 삭제가 실패했습니다.");
			model.addAttribute("url","/member/closeMember");
		}
		return "member/redirectMember";
		
	}
	

	
}
