package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;

public interface AdimnServiceChaengIm {

	// 관리자 화면 qna 리스트
	public List<QnAVO> getAdminQnaList();

	// 관리자 화면 필터링 qna
	public List<QnAVO> getAdminQnaWithFilter(String filterKey);

	// 관리자 화면 qna 상세보기
	public QnAVO adminQnaDetail(int qnaNum);

	// 답변 등록하기
	public void regReplyforQna(String content, String adminid, int qnanum);

	// qna 상태변경
	public void changeQnaStatus(int param1);

	// 상세보기에 답변표시
	public String replyofQna(int qnaNum);


}
