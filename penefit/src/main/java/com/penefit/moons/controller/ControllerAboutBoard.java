package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.service.ServiceAboutBoard;

@Controller
@RequestMapping("/board")
public class ControllerAboutBoard {
	
	@Autowired
	ServiceAboutBoard bservice;
	
	//공지사항리스트
	@GetMapping("notice")
	public void getCommuList(Model model) {  
		List<BoardVO> nlist = bservice.getNoticeList() ;
		model.addAttribute("nlist", nlist);
		//System.out.println("컨트롤러 : " + nlist);
	}
	


}
