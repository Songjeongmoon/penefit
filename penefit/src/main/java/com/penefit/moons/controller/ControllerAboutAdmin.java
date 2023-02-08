package com.penefit.moons.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.penefit.moons.domain.BoardVO;
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
	public String noticeRegDo(BoardVO bvo) {
		log.info(bvo.toString());
		adService.noticeReg(bvo);
		
		return "redirect:board/notice";
	}

}
