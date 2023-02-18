package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.service.AdminServiceChaeng;

@Controller
@RequestMapping("/admin")
public class AdminChaengController {

	@Autowired
	AdminServiceChaeng service;
	
	//관리자 화면 qna 리스트
	@GetMapping("/adminQnaList")
	public void adminQnaList(Model model) {
		List<QnAVO> list = service.getAdminQnaList();
		model.addAttribute("list", list);
	}
	
	// 관리자 화면 qna 상세보기
	@GetMapping("/adminQnaDetail")
	public void adminQnaDetail(Model model, int qnaNum ) {
		QnAVO q = service.adminQnaDetail(qnaNum);
		String reply = service.replyofQna(qnaNum);
		model.addAttribute("qna", q);
		model.addAttribute("reply", reply);
		
		
	}
	
	//qna 답변등록
	@PostMapping("/qnaReplyvalue")
	public String qnaReplyvalue(@RequestParam("content") String content,@RequestParam("adminid") String adminid,@RequestParam("qnanum") int qnanum) {
		System.out.println(content);
		System.out.println(adminid);
		System.out.println(qnanum);
		service.regReplyforQna(content, adminid, qnanum);
		service.changeQnaStatus(qnanum);
		return "redirect:adminQnaList";
	}
}
