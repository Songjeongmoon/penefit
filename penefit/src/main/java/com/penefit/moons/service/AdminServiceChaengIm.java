package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;

public interface AdminServiceChaengIm {

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

	public List<ReviewVO> getReviewList();

	public  List<ReviewVO> getReviewListNew();

	public List<QnAVO> qnaListToConfirm();

	public int getQnACountAll();

	public int getQnACount();

	public double spendtime();

	public List<QnAtype> getQnaType();

	public ReviewVO reviewDetail(int review_num);

	public void deleteReview(int review_num);

	public ReviewScore bestClass();

	public ReviewScore worstClass();

	public int getReviewCount();

	public List<NoticeVO> getNotice();

	public List<NoticeVO> getNoticeNew();

	public List<NoticeVO> getsearchNotice(String keyword);

	public NoticeVO noticeDetail(int notice_num);

	public void modiNotice(NoticeVO notice);

	public void delNotice(int notice_num);

	public List<SuggestDTO> suggestNew();

	public List<SuggestDTO> suggestAll();

	public List<SuggestDTO> getsearchSuggestion(String keyword);

	public List<SuggestType> suggestType();



}
