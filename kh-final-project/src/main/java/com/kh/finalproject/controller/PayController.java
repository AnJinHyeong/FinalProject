package com.kh.finalproject.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.repository.PayDao;
import com.kh.finalproject.service.PayService;
import com.kh.finalproject.vo.Criteria;
import com.kh.finalproject.vo.PageMaker;
import com.kh.finalproject.vo.pay.PayApprovePrepareVO;
import com.kh.finalproject.vo.pay.PayApproveVO;
import com.kh.finalproject.vo.pay.PayReadyPrepareVO;
import com.kh.finalproject.vo.pay.PayReadyVO;
import com.kh.finalproject.vo.pay.PaySearchVO;

@Controller
@RequestMapping("/pay")
public class PayController {

	@Autowired 
//	@Qualifier("payDao")
	private PayService payService;
	
	@GetMapping("/confirm")
	public String confirm() {
		return "pay/confirm";//"/WEB-INF/views/pay/confirm.jsp"
	}
	
	@PostMapping("/confirm")
	public String confirm(
			HttpSession session,
			@ModelAttribute PayReadyPrepareVO prepareVO) throws URISyntaxException {
		//결제 준비 요청을 보낸다
		int memberNo = (int)session.getAttribute("memberNo");//회원번호 추출
		prepareVO.setPartner_user_id(String.valueOf(memberNo));

		//DB실행
		PayReadyVO readyVO = payService.ready(prepareVO);

		//= partner_order_id / partner_user_id / tid
		session.setAttribute("partner_order_id", readyVO.getPartner_order_id());
		session.setAttribute("partner_user_id", readyVO.getPartner_user_id());
		session.setAttribute("tid", readyVO.getTid());
		//사용자에게 결제 페이지 주소로 재접속 지시를 내린다(리다이렉트)
		return "redirect:"+readyVO.getNext_redirect_pc_url();
	}

	@GetMapping("/success")
//	public String success(@RequestParam String pg_token) {
	public String success(
			HttpSession session,
			@ModelAttribute PayApprovePrepareVO prepareVO) throws URISyntaxException {
		
		//세션에서 데이터를 추출 후 삭제
		prepareVO.setPartner_order_id((String)session.getAttribute("partner_order_id"));
		prepareVO.setPartner_user_id((String)session.getAttribute("partner_user_id"));
		prepareVO.setTid((String)session.getAttribute("tid"));
		prepareVO.setTotal_amount((String)session.getAttribute("total_amount"));
		
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		session.removeAttribute("total_amount");

		PayApproveVO approveVO = payService.approve(prepareVO);
		
		//결제 승인이 완료된 시점 : 승인 정보(PayApproveVO)를 DB에 저장하는 등의 작업을 수행
		
		//결제 정보 조회 페이지 또는 결제 성공 알림페이지로 리다이렉트 한다
		return "redirect:result_success?tid="+approveVO.getTid();
	}
	
	@GetMapping("/result_success")
	public String resultSuccess(@ RequestParam String tid,Model model) throws URISyntaxException {
		PaySearchVO searchVO = payService.search(tid);
		model.addAttribute("searchVO", searchVO);
		return "pay/resultSuccess";//"/WEB-INF/views/pay/resultSuccess.jsp"
	}


	@Autowired
	private PayDao payDao;
	
	@GetMapping("/history")
	public String history(HttpSession session, Model model, Criteria cri) {

		int memberNo = (int)session.getAttribute("memberNo");
		
		model.addAttribute("list", payDao.payList(memberNo,cri));
			
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(payDao.listCount(memberNo));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "pay/history";
	}
	
	
	@GetMapping("/cancel")
	public String cancel(HttpSession session) {
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		session.removeAttribute("total_amount");
		
		return "pay/resultCancel";
	}
	
	@GetMapping("/fail")
	public String fail(HttpSession session) {
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		session.removeAttribute("total_amount");
		
		return "pay/resultFail";
	}
	
}
