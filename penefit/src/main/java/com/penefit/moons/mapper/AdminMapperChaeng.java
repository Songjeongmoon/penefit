package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;

@Mapper
public interface AdminMapperChaeng {

	//관리자 화면의 qna 목록
	public List<QnAVO> getAdminQnaList();

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
	public List<ReviewVO> getReviewList();

	public List<ReviewVO> getReviewListNew();

	public List<QnAVO> qnaListToConfirm();

	public int getQnACountAll();

	public int getQnACount();

	public double spendtime();

	public List<QnAtype> getQnaType();

	public ReviewVO reviewDetail(@Param("review_num") int review_num);

	public void deleteReview(@Param("review_num") int review_num);

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
