package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class SponsorInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Integer memberNo = (Integer)request.getSession().getAttribute("memberNo");
		
		if(memberNo == null && request.getMethod().equals("POST")) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		else {
			return true;
		}
	}
	
}
