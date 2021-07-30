package com.kh.finalproject.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.entity.SponsorDto;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.vo.MsgVo;
import com.kh.finalproject.vo.SponsorListVo;


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
	public MsgVo msgInformation(HttpSession session, @RequestParam int msgNo)
	{
		MessageDto messageDto = messageDao.getByMsgNo(msgNo);
		
		
		return MsgVo.builder()
				.msgNo(msgNo)
				.msgTitle(messageDto.getMsgTitle())
				.msgDate(messageDto.getMsgDate())
				.receiverNo(messageDto.getReceiverNo())
				.msgContent(messageDto.getMsgContent())
				.senderNo(messageDto.getSenderNo())
				.build();
	}
	

	
}
