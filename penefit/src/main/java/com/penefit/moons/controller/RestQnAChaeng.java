package com.penefit.moons.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.service.QnaChaengI;

@RestController
public class RestQnAChaeng {


	@Autowired
	QnaChaengI service;
	
	@GetMapping("/qnaList")
	public List<QnAVO> getQnaList(HttpSession session, int pageNum){
		String member_id = (String) session.getAttribute("member_id");
		List<QnAVO> list = service.getQnaList(member_id, pageNum);
		return list;
	}
	
	@GetMapping("/qnaOneList/qna_num/{qna_num}")
	public QnAVO qnaOneList(@PathVariable int qna_num, HttpSession session){
		String member_id = (String) session.getAttribute("member_id");
		//문의정보 가져오기
		QnAVO q = service.qnaOneList(member_id, qna_num);
		return q;
	}
	
	@GetMapping("/qnaReply/qna_num/{qna_num}")
	public String getQnaReply(@PathVariable int qna_num){
		//답변내용 가져오기
		String r = service.getQnaReply(qna_num);
		System.out.println(r);
		if(r=="") {
			r="";
		}
		return r;
	}
}
