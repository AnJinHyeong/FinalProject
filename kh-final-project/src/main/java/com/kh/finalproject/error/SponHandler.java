package com.kh.finalproject.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kh.finalproject.controller.ProjectBoardController;

@ControllerAdvice(basePackageClasses = {ProjectBoardController.class})
public class SponHandler {
	
	@ExceptionHandler(SponFailException.class)
	public String sponFailExceptionHandler(Exception ex) {
		String target = ex.getMessage();
		int projectNo = Integer.parseInt(target.substring(target.indexOf(":") + 1, target.indexOf(",")));
		return "redirect:/projectBoard/" + projectNo;
	}
	
	@ExceptionHandler(PercentCalcFailException.class)
	public String percentCalcFailExceptionHandler(Exception ex) {
		String target = ex.getMessage();
		int projectNo = Integer.parseInt(target.substring(target.indexOf(":") + 1, target.indexOf(",")));
		System.out.println(target);
		return "redirect:/projectBoard/" + projectNo;
	}
	
}
