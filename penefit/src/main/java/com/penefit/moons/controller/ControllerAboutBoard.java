package com.penefit.moons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
	
	//공지사항리스
	@GetMapping("/notice")
	public void getNoticeList(Model model, int pageNum, int start) {
		if(start < 1) {
			start=1;
		}else if(start < 1 || pageNum < 1) {
			start = 1;
			pageNum = 1;
		}
		int param = pageNum * 10 - 10;
		List<NoticeVO> nlist = bservice.getpages(param);
		int notice_count = bservice.countNotice();
		
		model.addAttribute("notice_count", notice_count);			//공지사항 게시물 건수 보낸다~~~
		model.addAttribute("nlist", nlist);							//공지사항 리스트 보낸다~~~
		model.addAttribute("pstart", start);
	
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
	 
	
	//지역 게시판 
	@GetMapping("/cityBoardview")
	public String cityBoard1(Model model, int pageNum, int start) {
		
		pageNum = pageNum * 10 - 10;
		
		String sel = "";
		String keyword = "";
				
		List<BoardVO> list = bservice.getAllCityList(pageNum, sel, keyword);
		int count = bservice.countCity();
		
		if(count % 10 == 0) {
			count = count / 10;
		}else {
			count = count / 10 + 1;
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("start", start);
		
		return "/board/cityBoard";
	}
	
	@GetMapping("/cityBoards")
	@ResponseBody
	public List<BoardVO> getBoardList(int pageNum, String sel, String keyword){
		pageNum = pageNum * 10 - 10;
		return bservice.getAllCityList(pageNum, sel, keyword);
	}
	
	
	//검색 페이징
	@GetMapping("/citySearchCount")
	@ResponseBody
	public int getBoardCount(int pageNum, String sel, String keyword) {
		int result = bservice.getSearchCount(pageNum, sel, keyword);
		if(result % 10 == 0) {
			result = result / 10;
		} else {
			result = result / 10 + 1;
		}
		return result;
	}
	
	
	/*@GetMapping("/cityBoardView")
	public void cityBoard1 (int pageNum, Model model, int start) {
		int param = pageNum * 10 - 10;
		List<BoardVO> list = bservice.getAllCityList(param);
		int notice_count = bservice.countCity();
		
		model.addAttribute("notice_count", notice_count);
		model.addAttribute("list", list);
		model.addAttribute("pstart", start);
	}*/
		
	// 지역별게시판 등록뷰
	@GetMapping("/city_regView")
	public String cityBoardReg() {

		return "board/city_regView";
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
	public @ResponseBody List<BoardVO> getSearchCity(Model model, String keyword, String citysel, HttpServletResponse res) {
		if(keyword.equals("")) {
			try {
				res.setContentType("text/html; charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.print("<script> alert('입력란을 채워주세요.'); location.href='/board/cityBoardview?pageNum=1&start=1';</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
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
