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

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.service.ServiceAboutBoard;


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
	
	//지역 게시판 
	@GetMapping("/cityBoardview")
	public String cityBoard1() {
		return "/board/cityBoard";
	}
	
	// 지역별게시판 등록뷰
	@GetMapping("/city_regView")
	public String cityBoardReg() {

		return "board/city_regView";
	}
	
	//지역 게시판 글등록
	
	
	//@PostMapping("/cityReg.do")
	public String cityBoardRegDo2(BoardVO bvo) {
		bservice.cityReg(bvo);
		System.out.println("bvo:"+bvo);
		
		return "redirect:citycity";
	}
	
	
	//지역 게시판 상세보기
	@GetMapping("/city_detail")
	public void citySelectOne(@RequestParam("board_num") int board_num, Model model) {
		BoardVO cvo = bservice.citySelectOne(board_num);
		model.addAttribute("cvo",cvo);
	}
	
	//지역게시판 수정
	@PostMapping("/city_modi.do")
	public String modiCityDo(BoardVO bvo) {
		bservice.modiCity(bvo);
		
		return "redirect:cityBoardview";
	}

	//지역게시판 검색
	@GetMapping("/citySearch")
	public @ResponseBody List<BoardVO> getSearchCity(Model model, String keyword, String citysel) {
		System.out.println(keyword);
		System.out.println("=======================");
		System.out.println(citysel);
		List<BoardVO> list = bservice.searchCity(keyword, citysel);
		
		
		return list;
	}

	
	//공지사항 수정 view로
	@GetMapping("/city_modiView")
	public String modiCity(@RequestParam int board_num, Model model) {
		BoardVO cvo = bservice.citySelectOne(board_num);
		model.addAttribute("cvo", cvo);
		
		return "board/city_modiView";
	}
	
	//지역게시판 삭제
	@GetMapping("/delCity")
	public String delCity(int board_num) {
		
		bservice.delCity(board_num);
		
		return "redirect:cityBoardview";
	}
	
	

	
	
	


}
