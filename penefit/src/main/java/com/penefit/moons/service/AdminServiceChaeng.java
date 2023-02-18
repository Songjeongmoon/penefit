package com.penefit.moons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.mapper.AdminMapperChaeng;

@Service
public class AdminServiceChaeng  implements AdimnServiceChaengIm{

	@Autowired
	AdminMapperChaeng mapper;

	//관리자 화면 qna 리스트
	@Override
	public List<QnAVO> getAdminQnaList() {
		List<QnAVO> list = mapper.getAdminQnaList();
		return list;
	}

	@Override
	public List<QnAVO> getAdminQnaWithFilter(String filterKey) {
		List<QnAVO> list = mapper.getAdminQnaWithFilter(filterKey);
		return list;
	}

	//관리자 화면 qna 상세보기
	@Override
	public QnAVO adminQnaDetail(int qnaNum) {
		QnAVO q = mapper.adminQnaDetail(qnaNum);
		return q;
	}

	@Override
	public void regReplyforQna(String content, String adminid, int qnanum) {
		mapper.regReplyforQna(content, adminid, qnanum);
	}

	@Override
	public void changeQnaStatus(int qnanum) {
		mapper.changeQnaStatus(qnanum);
	}

	@Override
	public String replyofQna(int qnaNum) {
		String reply = mapper.replyofQna(qnaNum);
		return reply;
	}
	
	
}
