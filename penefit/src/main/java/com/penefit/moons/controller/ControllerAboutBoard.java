package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.service.ServiceAboutBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class ControllerAboutBoard {
	
	@Autowired
	ServiceAboutBoard bservice;
	
	//공지사항리스트
	@GetMapping("/notice")
	public void getNoticeList(Model model) {  
		List<NoticeVO> nlist = bservice.getNoticeList() ;
		model.addAttribute("nlist", nlist);
		//System.out.println("컨트롤러 : " + nlist);
	}
	
	//공지사항 상세
	@GetMapping("/notice_detail")
	public void getNoticeOne(@RequestParam int notice_num, Model model) {
		NoticeVO nvo = bservice.noticeSelectOne(notice_num);
		
		model.addAttribute("nvo", nvo);
	}
	
	//공지사항 수정 view로
	@GetMapping("/notice_modiView")
	public String modiNotice(@RequestParam int notice_num, Model model) {
		NoticeVO nvo = bservice.noticeSelectOne(notice_num);
		model.addAttribute("nvo", nvo);
		
		return "board/notice_modiView";
	}
	
	//공지사항 수정
	@PostMapping("/notice_modi.do")
	public String modiNoticeDo(NoticeVO nvo) {
		bservice.modiNotice(nvo);
		
		return "redirect:notice";
	}
	
	//공지사항 삭제
	@GetMapping("/delNotice")
	public String delNotice(int notice_num) {
		
		bservice.delNotice(notice_num);
		
		return "redirect:notice";
	}
	

	
	//QnA list뽑
	@GetMapping("/QnA")
	public void getQnAList(Model model) {
		List<QnAVO> qlist = bservice.qlist();
		model.addAttribute("qlist", qlist);
	}
	
	//QnA 글등록 뷰
	@GetMapping("/QnARegView")
	public String qnaBoardForm() {
		
		return "board/QnARegView";
	}
	
	//QnA 글등록
	@PostMapping("/QnARegDo")
	public String qnaRedDO(QnAVO qna) {
		bservice.qnaReg(qna);
		log.info(qna.toString());
		return "redirect:QnA";
	}
	
	
	//QnA상세페이지
	@GetMapping("/qna_detail")
	public void qnaSelecOne(@RequestParam("qna_num") int qna_num, Model model) {
		QnAVO qna = bservice.qnaSelectOne(qna_num);
		model.addAttribute("qna",qna);
	}
	
	//QnA수정페이지
	@GetMapping("/qna_ModiView")
	public void qnaModiView(@RequestParam("qna_num") int qna_num, Model model) {
		QnAVO qvo = bservice.qnaSelectOne(qna_num);
		
		model.addAttribute("qvo",qvo);
	}
	
	@PostMapping("/qna_ModiDo")
	public String modiQnA(QnAVO qvo) {
		bservice.modiQnA(qvo);
		
		return "redirect:QnA";
	}
	
	//QnA삭제
	@GetMapping("/qna_delete")
	public String delQnA(int qna_num) {
		bservice.delQnA(qna_num);
		
		return "redirect:QnA";
	}
	
	//FAQ 게시판
	@GetMapping("/FAQ")
	public void faqList(Model model) {
		List<BoardVO> flist = bservice.getFaQList();
		model.addAttribute("flist",flist);	
	}
	
	//FAQ 게시판 상세
	@GetMapping("/faq_detail")
	public void faqSelectOne(@RequestParam("board_num") int board_num, Model model) {
		BoardVO faq = bservice.faqSelectOne(board_num);
		model.addAttribute("faq",faq);
	}
	
	@GetMapping("/cityBoardview")
	public String cityBoard1() {
		return "board/cityBoard";
	}
	
	
	
	
	


}
