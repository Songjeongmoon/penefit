package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.service.QnaChaengI;
import com.penefit.moons.service.ServiceAboutMember;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
public class QnAChaeng {

	@Autowired
	QnaChaengI service;
	
	@Autowired
	ServiceAboutMember serviceMember;
	
	@PostMapping("/qnaForm")
	public void qnaForm(HttpServletResponse res,  Model model, @Valid QnAVO qna, HttpSession session) {
		res.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = res.getWriter();
			if(qna.getQna_type().equals("")) {
				out.print("<script> alert('구분을 선택해주세요'); history.back(); </script>");
				out.close();
			} else if(qna.getQna_title().equals("")) {
				out.print("<script> alert('제목을 입력해주세요'); history.back(); </script>");
				out.close();
			} else if(qna.getQna_content().equals("")) {
				out.print("<script> alert('내용을 입력해주세요'); history.back(); </script>");
				out.close();
			} else {
				service.regQna(qna);
				out.print("<script> alert('등록 완료 되었습니다.'); location.href='/member/infoMember' </script>");
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/QnA")
	public String QnA(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		if(session.getAttribute("member_id") != null) {
			return "/board/QnA";
		} else {
			try {
				res.setContentType("text/html; charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.print("<script> alert('로그인 후 사용하실 수 있습니다.'); location.href='/member/login'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "";
	}
	
	
}
