package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

public class AdminInterceptor implements HandlerInterceptor{

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Integer memberNo = (Integer)request.getSession().getAttribute("memberNo");
		
		MemberDto memberDto = memberDao.getByMemberNo(memberNo);
		
		if(memberNo == null) {
			//response.sendError(401);
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		else if(!memberDto.getMemberGrade().equals("관리자")) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		else {
			return true;
		}
	}
}
