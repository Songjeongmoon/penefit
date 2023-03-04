package com.penefit.moons.service;

import java.util.List;

import org.apache.ibatis.javassist.bytecode.SignatureAttribute.ClassType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassRate;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;
import com.penefit.moons.mapper.AdminMapperChaeng;

@Service
public class AdminServiceChaeng  implements AdminServiceChaengIm{

	@Autowired
	AdminMapperChaeng mapper;

	//관리자 화면 qna 리스트
	@Override
	public List<QnAVO> getAdminQnaList(int startNum) {
		return mapper.getAdminQnaList(startNum);
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

	@Override
	public List<ReviewVO> getReviewList(int startNum) {
		return mapper.getReviewList(startNum);
	}
	@Override
	public List<ReviewVO> getReviewListNew(int startNum) {
		return mapper.getReviewListNew(startNum);
	}
	@Override
	public List<QnAVO> qnaListToConfirm(int startNum) {
		return mapper.qnaListToConfirm(startNum);
	}
	@Override
	public int getQnACountAll() {
		return mapper.getQnACountAll();
	}
	@Override
	public int getQnACount() {
		return mapper.getQnACount();
	}

	@Override
	public double spendtime() {
		return mapper.spendtime();
	}
	@Override
	public List<QnAtype> getQnaType() {
		return mapper.getQnaType();
	}

	@Override
	public ReviewVO reviewDetail(int review_num) {
		return mapper.reviewDetail(review_num);
	}
	@Override
	public void deleteReview(int review_num) {
		mapper.deleteReview(review_num);
	}
	@Override
	public ReviewScore bestClass() {
		return mapper.bestClass();
	}
	@Override
	public ReviewScore worstClass() {
		return mapper.worstClass();
	}
	@Override
	public int getReviewCount() {
		return mapper.getReviewCount();
	}

	@Override
	public List<NoticeVO> getNotice(String keyword, int startNum) {
		return mapper.getNotice(keyword, startNum);
	}

	@Override
	public List<NoticeVO> getNoticeNew(int startNum) {
		return mapper.getNoticeNew(startNum);
	}

	@Override
	public NoticeVO noticeDetail(int notice_num) {
		return mapper.noticeDetail(notice_num);
	}

	@Override
	public void modiNotice(NoticeVO notice) {
		mapper.modiNotice(notice);
	}
	@Override
	public void delNotice(int notice_num) {
		mapper.delNotice(notice_num);
	}
	@Override
	public List<SuggestDTO> suggestNew(int startNum) {
		return mapper.suggestNew(startNum);
	}
	@Override
	public List<SuggestDTO> suggestAll(String status, String keyword, int startNum) {
		return mapper.suggestAll(status, keyword, startNum);
	}
	@Override
	public List<SuggestDTO> getsearchSuggestion(String keyword) {
		return mapper.getsearchSuggestion(keyword);
	}
	@Override
	public List<SuggestType> suggestType() {
		return mapper.suggestType();
	}

	@Override
	public List<ClassVO> classListSearch(String keyword) {
		return mapper.classListSearch(keyword);
	}

	@Override
	public ClassRate classRate() {
		return mapper.classRate();
	}

	@Override
	public void moveCloseTbl(ClassVO classVO) {
		mapper.moveCloseTbl(classVO);
	}

	@Override
	public int openClass() {
		return mapper.openClass();
	}

	@Override
	public int allClass() {
		return mapper.allClass();
	}

	@Override
	public List<ClassType> classType() {
		return mapper.classType();
	}

	@Override
	public int todaysSales() {
		return mapper.todaysSales();
	}

	@Override
	public int monthlySales() {
		return mapper.monthlySales();
	}

	@Override
	public int yearlySales() {
		return mapper.yearlySales();
	}
	
	@Override
	public int weeklySales() {
		return mapper.weeklySales();
	}

	@Override
	public int dayChange() {
		return mapper.dayChange();
	}

	@Override
	public int weekChange() {
		return mapper.weekChange();
	}

	@Override
	public int monthChange() {
		return mapper.monthChange();
	}
	@Override
	public int buyaverage() {
		return mapper.buyaverage();
	}
	@Override
	public double averagePurchase() {
		return mapper.averagePurchase();
	}

	@Override
	public List<SuggestDTO> getListWithFilter(String keyword) {
		return mapper.getListWithFilter(keyword);
	}

	@Override
	public int getQnaAllMaxPage() {
		return mapper.getQnaAllMaxPage();
	}

	@Override
	public int getQnaNewMaxPage() {
		return mapper.getQnaNewMaxPage();
	}

	@Override
	public int getNoticeMaxPage(String keyword) {
		return mapper.getNoticeMaxPage(keyword);
	}

	@Override
	public int getNoticeNewPage() {
		return mapper.getNoticeNewPage();
	}

	@Override
	public int getSuggestNewPage() {
		return mapper.getSuggestNewPage();		
	}

	@Override
	public int getSuggestAllPage(String status, String keyword) {
		return mapper.getSuggestAllPage(status, keyword);
	}

	@Override
	public int getClassAllPage(String status, String keyword) {
		if(status.equals("end")) {
			return mapper.getClassAllPageEnd(keyword);			
		} else if(status.equals("active")) {
			return mapper.getClassAllPageActive(keyword);	
		} else {
			return mapper.getClassAllPage(keyword);
		}
	}

	@Override
	public int getReviewNewPage() {
		return mapper.getReviewNewPage();
	}
	
	@Override
	public int getReviewAllPage() {
		return mapper.getReviewAllPage();
	}
}
