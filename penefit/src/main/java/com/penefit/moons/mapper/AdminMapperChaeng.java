package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.bytecode.SignatureAttribute.ClassType;

import com.penefit.moons.domain.ClassRate;
import com.penefit.moons.domain.ClassTypeDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SalesReturnDTO;
import com.penefit.moons.domain.SalesTimeDTO;
import com.penefit.moons.domain.SalesWeek;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;

@Mapper
public interface AdminMapperChaeng {

	//관리자 화면의 qna 목록
	public List<QnAVO> getAdminQnaList(int startNum);

	//관리자 화면 필터링 qna
	public List<QnAVO> getAdminQnaWithFilter(String filterKey);

	//관리자 화면 qna 상세보기
	public QnAVO adminQnaDetail(int qnaNum);
	
	//답변 등록하기
	public void regReplyforQna(@Param("content") String param1 ,@Param("adminid") String param2,@Param("qnanum") int param3);

	//qna 상태변경
	public void changeQnaStatus(@Param("qnanum") int param1);

	//상세보기에 답변표시
	public String replyofQna(@Param("qnaNum") int param1);

	//리뷰목록
	public List<ReviewVO> getReviewList(int startNum);

	public List<ReviewVO> getReviewListNew(int startNum);

	public List<QnAVO> qnaListToConfirm(int startNum);

	public int getQnACountAll();

	public int getQnACount();

	public double spendtime();

	public List<QnAtype> getQnaType();

	public ReviewVO reviewDetail(@Param("review_num") int review_num);

	public void deleteReview(@Param("review_num") int review_num);

	public ReviewScore bestClass();

	public ReviewScore worstClass();

	public int getReviewCount();

	public List<NoticeVO> getNotice(@Param("keyword") String keyword, @Param("startNum") int startNum);

	public List<NoticeVO> getNoticeNew(int startNum);

	public NoticeVO noticeDetail(int notice_num);

	public void modiNotice(NoticeVO notice);

	public void delNotice(int notice_num);

	public List<SuggestDTO> suggestNew(int startNum);

	public List<SuggestDTO> suggestAll(@Param("status") String status, @Param("keyword") String keyword, @Param("startNum") int startNum);

	public List<SuggestDTO> getsearchSuggestion(String keyword);

	public List<SuggestType> suggestType();

	public List<ClassVO> classListSearch(String keyword);

	public ClassRate classRate();

	public void moveCloseTbl(ClassVO classVO);

	public int allClass();

	public int openClass();

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
	
	public int getSuggestAllPage(@Param("status") String status, @Param("keyword") String keyword);
	
	public int getClassAllPageEnd(String keyword);
	
	public int getClassAllPageActive(String keyword);
	
	public int getClassAllPage(String keyword);
	
	public int getReviewNewPage();
	
	public int getReviewAllPage();

	public List<ClassTypeDTO> classRegTypeRate();

	public List<SalesWeek> salesThisWeek();

	public List<SalesReturnDTO> dataReturndiv();

	public List<SalesTimeDTO> dataTimediv();
}
