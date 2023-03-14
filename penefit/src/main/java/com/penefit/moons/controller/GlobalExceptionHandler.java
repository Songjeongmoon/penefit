package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Controller
public class GlobalExceptionHandler {
	
	@ExceptionHandler(value = Exception.class)
	public void ExceptionHandle(Exception e, HttpServletResponse res) {
		res.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = res.getWriter();
			out.print("<script> alert('[error] 오류가 발생하였습니다.'); history.back();</script>");
			out.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
