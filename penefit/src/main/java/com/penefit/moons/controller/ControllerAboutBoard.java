package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.BoardVO;

@Controller
@RequestMapping("/board/*")
public class ControllerAboutBoard {
	
	@Autowired
	//커뮤니티 리스트
	@GetMapping("board/commuList")
	public String getCommuList() {
		List<BoardVO> list ;
		return null;
	}
	
	//공지사항 리스트
	@GetMapping("notice")
	public String noticeList() {
		
		
		return "notice";
	}

}
