package com.kh.finalproject.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kh.finalproject.controller.ProjectBoardController;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice(basePackageClasses = {ProjectBoardController.class})
public class SponHandler {
	
	@ExceptionHandler(SponFailException.class)
	public String paymentExceptionHandler(Exception ex) {
		System.out.println("sponfailException2222222222222222");
		return "redirect:/projectBoard/36";
	}
	
}
