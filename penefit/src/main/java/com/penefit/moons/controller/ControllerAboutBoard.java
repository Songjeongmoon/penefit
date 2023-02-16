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
import org.springframework.web.bind.annotation.RestController;

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
	public String modiNoticeDo(NoticeVO nvo, Model model) {
		bservice.modiNotice(nvo);
		
		return "redirect:notice";
	}
	
	//공지사항 삭제
	@GetMapping("/delNotice")
	public String delNotice(int notice_num) {
		
		bservice.delNotice(notice_num);
		
		return "redirect:notice";
	}
	
	//지역별 게시판
	@GetMapping("/cityBoard")
	public String reViewBoard() {  
		
		return "board/cityBoard";
	}
	
	
	//지역별게시판 뷰
	@GetMapping("/city_regView")
	public String cityBoardReg() {  
		
		return "board/city_regView";
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
		QnAVO qna = bservice.qnaSelectOnt(qna_num);
		model.addAttribute("qna",qna);
	}
	
	
	
	
	
	


}
