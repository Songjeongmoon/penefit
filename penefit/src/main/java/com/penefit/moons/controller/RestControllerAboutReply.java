package com.penefit.moons.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.service.ServiceAboutBoard;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RestControllerAboutReply {

	@Autowired
	ServiceAboutBoard bservice;
	
	// 각 지역별 게시판
	@GetMapping("/api/oneCityBoard")
	public List<BoardVO> getOneCityList(@RequestParam("check_city") String check_city) {
		List<BoardVO> oneCList = bservice.getCityListOne(check_city);
		log.info(check_city);
		return oneCList;
	}

	// 지역별 게시판
	@GetMapping("/api/cityBoard/")
	public List<BoardVO> cityBoard() {
		List<BoardVO> clist = bservice.getCitylist();
		return clist;
	}

	@PostMapping("/api/city/reply") // 댓글등록
	public String regReply(@RequestBody ReplyVO crvo) {
		int result = bservice.cityreplyReg(crvo);
		String msg = "";

		if (result == 1) {
			msg = "등록완료";
		} else {
			msg = "등록실패";
		}
		return msg;
	}

	@DeleteMapping("/api/city/delReply/reply_num/{reply_num}") // 댓글삭제
	public String delReply(@PathVariable("reply_num") String reply_numm) {
		int reply_num = Integer.parseInt(reply_numm);
		int result = bservice.cityReplyDel(reply_num);
		String msg = "";

		if (result == 1) {
			msg = "삭제완료";
		} else {
			msg = "삭제실패";

		}
		return msg;
	}

	
	@GetMapping("/api/city/replyList/board_num/{board_num}") // 댓글목록
	public List<ReplyVO> getReplyList(Model model, @PathVariable("board_num") int board_num) {
		System.out.println(board_num);
		List<ReplyVO> crlist = bservice.get_CityRlist(board_num);
		return crlist;
	}
	
	@PostMapping("/cityReg.do")
	public String cityBoardRegDo2(@RequestBody BoardVO bvo) {
		System.out.println("bvo:"+ bvo);
		System.out.println("--------------------");
		int result = bservice.cityReg(bvo);
		String msg="";
		System.out.println("bvo:"+ bvo);
		if(result == 1) {
			msg="등록 완료";
		}else{
			msg="등록 실패";
		}
		
		return msg;
	}
	
	




}
