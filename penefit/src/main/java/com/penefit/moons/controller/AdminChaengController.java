package com.penefit.moons.controller;

import java.util.List;

import org.apache.ibatis.javassist.bytecode.SignatureAttribute.ClassType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassRate;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.QnAtype;
import com.penefit.moons.domain.ReviewScore;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.SuggestType;
import com.penefit.moons.service.AdminServiceChaeng;
import com.penefit.moons.service.AdminServiceChaengIm;
import com.penefit.moons.service.AdminServiceSong;
import com.penefit.moons.service.AdminServiceSongIm;
import com.penefit.moons.service.ServiceAboutAdminI;
import com.penefit.moons.service.ServiceAboutBoard;
import com.penefit.moons.service.ServiceAboutBoardI;
import com.penefit.moons.service.ServiceAboutClassI;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminChaengController {

	@Autowired
	AdminServiceChaengIm service;
	
	@Autowired
	ServiceAboutClassI cservice;

	@Autowired
	ServiceAboutBoardI bservice;

	@Autowired
	ServiceAboutAdminI aservice;

	@Autowired
	AdminServiceSongIm asservice;
	
	
	@GetMapping("/")
	public String String(Model model) {
		return "admin/mainChaeng";
	}

	// 전체리뷰
	@GetMapping("/reviewLoadAll")
	public @ResponseBody List<ReviewVO> reviewList() {
		// 리뷰리스트
		List<ReviewVO> list = service.getReviewList();
		return list;
	}

	// 신규리뷰
	@GetMapping("/reviewLoadNew")
	public @ResponseBody List<ReviewVO> reviewLoadNew() {
		// 리뷰리스트 - 신규
		List<ReviewVO> list = service.getReviewListNew();
		return list;
	}

	@GetMapping("/qnaLoadAll")
	public @ResponseBody List<QnAVO> qnaLoadAll() {
		// qna리스트
		List<QnAVO> qnaList = service.getAdminQnaList();
		return qnaList;
	}

	@GetMapping("/reviewDetail")
	public @ResponseBody ReviewVO reviewDetail(int review_num) {
		return service.reviewDetail(review_num);

	}

	@GetMapping("/qnaLoadNew")
	public @ResponseBody List<QnAVO> qnaLoadNew() {
		// qna리스트 - 신규
		List<QnAVO> qnaListToConfirm = service.qnaListToConfirm();
		return qnaListToConfirm;
	}

	@GetMapping("/adminpage")
	public void adminpage() {
	}

	// 관리자 화면 qna 리스트
	@GetMapping("/adminQnaList")
	public void adminQnaList(Model model) {
		List<QnAVO> list = service.getAdminQnaList();
		model.addAttribute("list", list);
	}

	// 관리자 화면 qna 상세보기
	@GetMapping("/adminQnaDetail")
	@ResponseBody
	public QnAVO adminQnaDetail(Model model, int qnaNum) {
		QnAVO q = service.adminQnaDetail(qnaNum);
		String reply = service.replyofQna(qnaNum);
		q.setReply(reply);

		return q;
	}

	// qna 답변등록
	@PostMapping("/qnaReplyvalue")
	@ResponseBody
	public void qnaReplyvalue(@RequestParam("content") String content, @RequestParam("adminid") String adminid,
			@RequestParam("qnaNum") int qnaNum) {
		service.regReplyforQna(content, adminid, qnaNum);
		service.changeQnaStatus(qnaNum);

	}

	// qna 답변율
	@GetMapping("/qnaReplyRate")
	@ResponseBody
	public double qnaReplyRate() {
		double all = service.getQnACountAll();
		double some = service.getQnACount();
		double rate = (all - some) / all * 100;
		return rate;
	}

	// qna 답변소요시간
	@GetMapping("/spendtime")
	@ResponseBody
	public double spendtime() {
		double spendtime = service.spendtime();
		return spendtime;
	}

	// qna 문의종류
	@GetMapping("/qnaType")
	@ResponseBody
	public List<QnAtype> getQnaType() {
		List<QnAtype> qnaResult = service.getQnaType();
		return qnaResult;
	}

	// 리뷰 삭제하기
	@DeleteMapping("/deleteReview")
	@ResponseBody
	public void deleteReview(int review_num) {
		service.deleteReview(review_num);
	}

	// 금주최고의 강의
	@GetMapping("/bestClass")
	@ResponseBody
	public ReviewScore bestClass() {

		return service.bestClass();
	}

	// 금주최악의 강의
	@GetMapping("/worstClass")
	@ResponseBody
	public ReviewScore worstClass() {
		return service.worstClass();
	}

	@GetMapping("/class.what")
	@ResponseBody
	public ClassVO classinfo(String class_code) {
		return cservice.selectClassOne(class_code);
	}

	@GetMapping("/getReviewCount")
	@ResponseBody
	public int getReviewCount() {
		return service.getReviewCount();
	}

	@GetMapping("/getNotice")
	@ResponseBody
	public List<NoticeVO> getNotice() {
		return service.getNotice();
	}

	@GetMapping("/getNoticeNew")
	@ResponseBody
	public List<NoticeVO> getNoticeNew() {
		return service.getNoticeNew();
	}

	@PostMapping("/regNotice")
	@ResponseBody
	public void regNotice(NoticeVO notice) {
		aservice.noticeReg(notice);
	}

	@GetMapping("/getsearchNotice")
	@ResponseBody
	public List<NoticeVO> getsearchNotice(String keyword) {
		return service.getsearchNotice(keyword);
	}

	@GetMapping("/noticeDetail")
	@ResponseBody
	public NoticeVO noticeDetail(int notice_num) {
		return service.noticeDetail(notice_num);
	}
	
	@PutMapping("/modiNotice")
	@ResponseBody
	public void modiNotice(NoticeVO notice) {
		System.out.println(notice);
		service.modiNotice(notice);
	}

	@DeleteMapping("/delNotice")
	@ResponseBody
	public void delNotice(int notice_num) {
		service.delNotice(notice_num);
	}
	
	@GetMapping("/suggestNew")
	@ResponseBody
	public List<SuggestDTO> suggestNew() {
		return service.suggestNew();
	}
	
	@GetMapping("/suggestAll")
	@ResponseBody
	public List<SuggestDTO> suggestAll() {
		return service.suggestAll();
	}
	@GetMapping("/getsearchSuggestion")
	@ResponseBody
	public List<SuggestDTO> getsearchSuggestion(String keyword) {
		return service.getsearchSuggestion(keyword);
	}
	
	@GetMapping("/suggestType")
	@ResponseBody
	public List<SuggestType> suggestType(){
		return service.suggestType();
	}
	@GetMapping("/suggestDetail")
	@ResponseBody
	public SuggestDTO suggestDetail(int suggest_num) {
		return asservice.getSuggestionInfo(suggest_num);
	}
	@GetMapping("/classListAll")
	@ResponseBody
	public List<ClassVO> classListAll(){
		return asservice.getClassList();
	}
	@GetMapping("/classListSearch")
	@ResponseBody
	public List<ClassVO> classListSearch(String keyword){
		return service.classListSearch(keyword);
	}
	@GetMapping("/classRate")
	@ResponseBody
	public ClassRate classRate() {
		return service.classRate();
	}
	@GetMapping("/classDetail")
	@ResponseBody
	public ClassVO classDetail(String class_code) {
		return asservice.getClassOne(class_code);
	}
	@PostMapping("/classUpdate")
	@ResponseBody
	public void classUpdate(ClassVO classinfo, MultipartHttpServletRequest files) {
		 asservice.updateClass(classinfo, files);
	}
	
	@DeleteMapping("/delClass")
	@ResponseBody
	public void delClass(ClassVO classVO) {
		//종료된 클래스로 옮기기, 
		service.moveCloseTbl(classVO);
		//클래스 삭제
		asservice.deleteClass(classVO.getClass_code());
	}
	@PostMapping("/classreg")
	@ResponseBody
	public int classreg(int suggest_num) {
		int result = asservice.createClass(suggest_num);
		asservice.approveSuggestion(suggest_num);
		return result;
	}
	@PutMapping("/rejectSuggest")
	@ResponseBody
	public int rejectSuggest(int suggest_num, String reject_reason) {
		int result = asservice.rejectSuggestion(suggest_num, reject_reason);
		return result;
	}
	
	@GetMapping("/currentClassStatus")
	@ResponseBody
	public String currentClassStatus() {
		int openClass= service.openClass();
		int allClass= service.allClass();
		String result = openClass + " / " + allClass ;
		return result;
	}
	
	@GetMapping("/classType")
	@ResponseBody
	public List<ClassType> classType(){
		return service.classType();
	}
	
	@GetMapping("/todaysSales")
	@ResponseBody
	public int todaysSales() {
		int result = service.todaysSales();
		return result;
	}
	@GetMapping("/weeklySales")
	@ResponseBody
	public int weeklySales() {
		int result = service.weeklySales();
		return result;
	}
	
	@GetMapping("/monthlySales")
	@ResponseBody
	public int monthlySales() {
		int result = service.monthlySales();
		return result;
	}
	@GetMapping("/yearlySales")
	@ResponseBody
	public int yearlySales() {
		int result = service.yearlySales();
		return result;
	}
	
	@GetMapping("/dayChange")
	@ResponseBody
	public int dayChange() {
		int result = service.dayChange();
		return result;
	}
	
	@GetMapping("/weekChange")
	@ResponseBody
	public int weekChange() {
		int result = service.weekChange();
		return result;
	}
	@GetMapping("/monthChange")
	@ResponseBody
	public int monthChange() {
		int result = service.monthChange();
		return result;
	}
	
	@GetMapping("/buyaverage")
	@ResponseBody
	public int buyaverage() {
		int result = service.buyaverage();
		return result;
	}
	
	@GetMapping("/averagePurchase")
	@ResponseBody
	public double averagePurchase() {
		double result = service.averagePurchase();
		return result;
	}
}
