package com.penefit.moons.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.AdminMapperChaeng;

@Service
public class AdminServiceChaeng  implements AdimnServiceChaengIm{

	@Autowired
	AdminMapperChaeng mapper;

	//관리자 화면 qna 리스트
	@Override
	public List<QnAVO> getAdminQnaList() {
		return mapper.getAdminQnaList();
	}

	@Override
	public List<QnAVO> getAdminQnaWithFilter(String filterKey) {
		List<QnAVO> list = mapper.getAdminQnaWithFilter(filterKey);
		return list;
	}

	//관리자 화면 qna 상세보기
	@Override
	public QnAVO adminQnaDetail(int qnaNum) {
		return mapper.adminQnaDetail(qnaNum);
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
		return mapper.replyofQna(qnaNum);
	}
	
}
