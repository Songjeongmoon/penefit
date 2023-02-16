package com.penefit.moons.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.service.ServiceAboutBoard;

@RestController
@RequestMapping("/board/*")
public class RestControllerAboutReply {
	
	@Autowired
	ServiceAboutBoard bservice;
	
	@PostMapping("/replyReg")			//댓글등록							
	public String regReply(@RequestBody ReplyVO rvo) {
		int result = bservice.replyReg(rvo);
		String msg="";
		
		if(result == 1) {
			msg="등록완료";
		}else {
			msg="등록실패";
		}
		return msg;
	}
	
	
	
	

}
