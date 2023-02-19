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

	@PostMapping("/api/qna/reply") // 댓글등록
	public String regReply(@RequestBody ReplyVO rvo) {
		int result = bservice.replyReg(rvo);
		String msg = "";

		if (result == 1) {
			msg = "등록완료";
		} else {
			msg = "등록실패";
		}
		return msg;
	}

	@DeleteMapping("/api/qna/delReply/qna_num/{qna_num}") // 댓글삭제
	public String delReply(@PathVariable("qna_num") int qna_num) {
		int result = bservice.replyDel(qna_num);
		String msg = "";

		if (result == 1) {
			msg = "삭제완료";
		} else {
			msg = "삭제실패";

		}
		return msg;
	}

	@GetMapping("/api/qna/replyList/qna_num/{qna_num}") // 댓글목록
	public List<ReplyVO> getReplyList(Model model, @PathVariable("qna_num") int qna_num) {
		List<ReplyVO> rlist = bservice.getRlist(qna_num);
		System.out.println(rlist);
		return rlist;
	}

	// 각 지역별 게시판
	@GetMapping("/api/oneCityBaord")
	public List<BoardVO> getOneCityList(@RequestParam("check_city") String check_city) {
		List<BoardVO> oneCList = bservice.getCityListOne(check_city);
		log.info(check_city);
		return oneCList;
	}

	// 지역별게시판 등록뷰
	@GetMapping("/city_regView")
	public String cityBoardReg() {

		return "board/city_regView";
	}

	// 지역별 게시판
	@GetMapping("/api/cityBoard/")
	public List<BoardVO> cityBoard() {
		List<BoardVO> clist = bservice.getCitylist();
		return clist;
	}

}
