package com.penefit.moons.service;

import java.util.List;

import org.apache.ibatis.javassist.bytecode.SignatureAttribute.ClassType;

import com.penefit.moons.domain.ClassRate;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;

public interface AdminServiceChaengIm {

	// 관리자 화면 qna 리스트
	public List<QnAVO> getAdminQnaList(int startNum);

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

	public List<ReviewVO> getReviewList(int startNum);

	public  List<ReviewVO> getReviewListNew(int startNum);

	public List<QnAVO> qnaListToConfirm(int startNum);

	public int getQnACountAll();

	public int getQnACount();

	public double spendtime();

	public List<QnAtype> getQnaType();

	public ReviewVO reviewDetail(int review_num);

	public void deleteReview(int review_num);

	public ReviewScore bestClass();

	public ReviewScore worstClass();

	public int getReviewCount();

	public List<NoticeVO> getNotice(String keyword, int startNum);

	public List<NoticeVO> getNoticeNew(int startNum);


	public NoticeVO noticeDetail(int notice_num);

	public void modiNotice(NoticeVO notice);

	public void delNotice(int notice_num);

	public List<SuggestDTO> suggestNew(int startNum);

	public List<SuggestDTO> suggestAll(String status, String keyword, int startNum);

	public List<SuggestDTO> getsearchSuggestion(String keyword);

	public List<SuggestType> suggestType();

	public List<ClassVO> classListSearch(String keyword);

	public ClassRate classRate();

	public void moveCloseTbl(ClassVO classVO);

	public int openClass();

	public int allClass();

	public List<ClassType> classType();

	public int todaysSales();

	public int monthlySales();

	public int yearlySales();

	public int weeklySales();

	public int dayChange();

	public int weekChange();

	public int monthChange();

	public int buyaverage();

	public double averagePurchase();
	
	public List<SuggestDTO> getListWithFilter(String keyword);

	public int getQnaAllMaxPage();
	
	public int getQnaNewMaxPage();
	
	public int getNoticeMaxPage(String keyword);
	
	public int getNoticeNewPage();
	
	public int getSuggestNewPage();
	
	public int getSuggestAllPage(String status, String keyword);
	
	public int getClassAllPage(String status, String keyword);
	
	public int getReviewNewPage();
	
	public int getReviewAllPage();
}
