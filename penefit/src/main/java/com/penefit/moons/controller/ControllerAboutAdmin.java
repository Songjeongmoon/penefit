package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.service.ServiceAboutAdmin;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ControllerAboutAdmin {
	
	@Autowired
	ServiceAboutAdmin adService;
	
	@GetMapping("adminView")			//관리자용페이지
	public String adminView() {
		
		return "adminView";
	}
	
	@GetMapping("notice_Reg")			//공지사항 등룍 폼
	public String noticeRegView() {
		
		return "notice_Reg";
	}
	
	@PostMapping("notice_reg.do")		//공지사항 등록
	public String noticeRegDo(NoticeVO nvo, HttpServletResponse res) {
		res.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = res.getWriter();
			if(nvo.getNotice_title().equals("")) {
				out.print("<script> alert('제목을 입력해주세요.'); history.back();</script>");
				out.close();
			} else if(nvo.getNotice_content().equals("")) {
				out.print("<script> alert('내용을 입력해주세요.'); history.back();</script>");
				out.close();
			} else {				
				adService.noticeReg(nvo);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/notice?pageNum=1&start=1";
	}
	
	@GetMapping("errorWindow_404ver")
	public String errorView1() {
		return "errorWindow_404ver";
	}
	
	
	@GetMapping("errorWindow_500ver")
	public String errorView2() {
		return "errorWindow_500ver";
	}
}
