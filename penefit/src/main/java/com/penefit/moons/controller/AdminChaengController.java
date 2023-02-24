package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.service.AdminServiceChaeng;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminChaengController {

	@Autowired
	AdminServiceChaeng service;


	@GetMapping("/")
	public String String(Model model) {
		return "admin/mainChaeng";
	}
	
	//전체리뷰
	@GetMapping("/reviewList")
	public @ResponseBody List<QnAVO> reviewList() {
		// qna리스트
		List<QnAVO> qnaList = service.getAdminQnaList();
		return qnaList;
	}
	
	//신규리뷰
	@GetMapping("/reviewLoadNew")
	public @ResponseBody List<QnAVO> reviewLoadNew() {
		// qna리스트 - 신규
		List<QnAVO> qnaListToConfirm = service.qnaListToConfirm();
		return qnaListToConfirm;
	}
	
	@GetMapping("/qnaLoadAll")
	public @ResponseBody List<QnAVO> qnaLoadAll() {
		// qna리스트
		List<QnAVO> qnaList = service.getAdminQnaList();
		return qnaList;
	}

	@GetMapping("/qnaLoadNew")
	public @ResponseBody List<QnAVO> qnaLoadNew() {
		// qna리스트 - 신규
		List<QnAVO> qnaListToConfirm = service.qnaListToConfirm();
		return qnaListToConfirm;
	}

	@GetMapping("/adminpage")
	public void adminpage() {
	}

	// 관리자 화면 qna 리스트
	@GetMapping("/adminQnaList")
	public void adminQnaList(Model model) {
		List<QnAVO> list = service.getAdminQnaList();
		model.addAttribute("list", list);
	}

	// 관리자 화면 qna 상세보기
	@GetMapping("/adminQnaDetail")
	@ResponseBody
	public QnAVO adminQnaDetail(Model model, int qnaNum) {
		QnAVO q = service.adminQnaDetail(qnaNum);
		String reply = service.replyofQna(qnaNum);
		q.setReply(reply);

		return q;
	}

	// qna 답변등록
	@PostMapping("/qnaReplyvalue")
	@ResponseBody
	public void qnaReplyvalue(@RequestParam("content") String content, @RequestParam("adminid") String adminid,
			@RequestParam("qnaNum") int qnaNum) {
		service.regReplyforQna(content, adminid, qnaNum);
		service.changeQnaStatus(qnaNum);

	}

	// qna 답변율
	@GetMapping("/qnaReplyRate")
	@ResponseBody
	public double qnaReplyRate() {
		double all = service.getQnACountAll();
		double some = service.getQnACount();
		double rate = (all - some) / all * 100;
		return rate;
	}

	// qna 답변소요시간
	@GetMapping("/spendtime")
	@ResponseBody
	public double spendtime() {
		double spendtime = service.spendtime();
		return spendtime;
	}

	// qna 문의종류
	@GetMapping("/qnaType")
	@ResponseBody
	public List<QnAtype> getQnaType() {
		List<QnAtype> qnaResult = service.getQnaType();
		System.out.println(qnaResult.toString());
		return qnaResult;
	}

}
