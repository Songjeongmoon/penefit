package com.penefit.moons.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import com.penefit.moons.service.AdminServiceChaengIm;
import com.penefit.moons.service.AdminServiceSongIm;
import com.penefit.moons.service.ServiceAboutAdminI;
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
	public @ResponseBody List<ReviewVO> reviewList(int startNum) {
		// 리뷰리스트
		startNum = (startNum - 1) * 5;
		List<ReviewVO> list = service.getReviewList(startNum);
		return list;
	}

	// 신규리뷰
	@GetMapping("/reviewLoadNew")
	public @ResponseBody List<ReviewVO> reviewLoadNew(int startNum) {
		// 리뷰리스트 - 신규
		startNum = (startNum - 1) * 5;
		List<ReviewVO> list = service.getReviewListNew(startNum);
		System.out.println(list);
		return list;
	}

	@GetMapping("/qnaLoadAll")
	public @ResponseBody List<QnAVO> qnaLoadAll(int startNum) {
		// qna리스트
		startNum = (startNum - 1) * 5;
		List<QnAVO> qnaList = service.getAdminQnaList(startNum);
		return qnaList;
	}

	@GetMapping("/reviewDetail")
	public @ResponseBody ReviewVO reviewDetail(int review_num) {
		return service.reviewDetail(review_num);

	}

	@GetMapping("/qnaLoadNew")
	public @ResponseBody List<QnAVO> qnaLoadNew(int startNum) {
		// qna리스트 - 신규
		startNum = (startNum - 1) * 5;
		List<QnAVO> qnaListToConfirm = service.qnaListToConfirm(startNum);
		return qnaListToConfirm;
	}

	@GetMapping("/adminpage")
	public void adminpage() {
	}

	// 관리자 화면 qna 리스트
	@GetMapping("/adminQnaList")
	public void adminQnaList(Model model) {
		int startNum = 0;
		List<QnAVO> list = service.getAdminQnaList(startNum);
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
	public String qnaReplyvalue(@RequestParam("content") String content, @RequestParam("adminid") String adminid,
			@RequestParam("qnaNum") int qnaNum) {
		if(content.equals("") || adminid.equals("")) {
			return "공백이 존재합니다";
		} else {
			service.regReplyforQna(content, adminid, qnaNum);
			service.changeQnaStatus(qnaNum);	
			return "완료";
		}
		

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
	public List<NoticeVO> getNotice(String keyword, int startNum) {
		startNum = (startNum - 1) * 4;
		return service.getNotice(keyword, startNum);
	}

	@GetMapping("/getNoticeNew")
	@ResponseBody
	public List<NoticeVO> getNoticeNew(int startNum) {
		startNum = (startNum - 1) * 5;
		return service.getNoticeNew(startNum);
	}

	@PostMapping("/regNotice")
	@ResponseBody
	public String regNotice(NoticeVO notice, HttpServletResponse res) {
		if(notice.getNotice_title().equals("") || notice.getNotice_content().equals("")) {
			return "공백이 존재합니다";
		}else {
			aservice.noticeReg(notice);	
			return "등록 완료";
		}
	}

	@GetMapping("/noticeDetail")
	@ResponseBody
	public NoticeVO noticeDetail(int notice_num) {
		return service.noticeDetail(notice_num);
	}
	
	@PutMapping("/modiNotice")
	@ResponseBody
	public void modiNotice(NoticeVO notice) {
		service.modiNotice(notice);
	}

	@DeleteMapping("/delNotice")
	@ResponseBody
	public void delNotice(int notice_num) {
		service.delNotice(notice_num);
	}
	
	@GetMapping("/suggestNew")
	@ResponseBody
	public List<SuggestDTO> suggestNew(int startNum) {
		return service.suggestNew(startNum);
	}
	
	@GetMapping("/suggestAll")
	@ResponseBody
	public List<SuggestDTO> suggestAll(String status, String keyword, int startNum) {
		startNum = (startNum - 1) * 5;
		return service.suggestAll(status, keyword, startNum);
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
	public List<ClassVO> classListAll(String status, String keyword, int startNum){
		startNum = (startNum - 1) * 10;
		return asservice.getClassList(status, keyword, startNum);
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
	@PutMapping("/classUpdate")
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
	
    @GetMapping("/getListWithFilter")
    @ResponseBody
    public List<SuggestDTO> getListWithFilter(String keyword) {
       return service.getListWithFilter(keyword);
    }
    
    @GetMapping("/qna-all-max-page")
    @ResponseBody
    public int getQnaAllMaxPage() {
    	int result = service.getQnaAllMaxPage();
    	if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
    }
    
    @GetMapping("/qna-new-max-page")
    @ResponseBody
    public int getQnaNewMaxPage() {
    	int result = service.getQnaNewMaxPage();
    	if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
    }
    
    @GetMapping("/notice-max-page")
    @ResponseBody
    public int getNoticeMaxPage(String keyword) {
    	int result = service.getNoticeMaxPage(keyword);
    	if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
    }
    
    @GetMapping("/notice-max-new")
    @ResponseBody
    public int getNoticeNewPage() {
		int result = service.getNoticeNewPage();
		if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
	}
    
    @GetMapping("/suggest-max-new")
    @ResponseBody
	public int getSuggestNewPage() {
		int result = service.getSuggestNewPage();	
		if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
	}
    
    @GetMapping("/suggest-max-all")
    @ResponseBody
	public int getSuggestAllPage(String status, String keyword) {
		int result = service.getSuggestAllPage(status, keyword);	
		if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
	}
    
    @GetMapping("/class-max-all")
    @ResponseBody
	public int getClassAllPage(String status, String keyword) {
		int result = service.getClassAllPage(status, keyword);	
		if(result % 10 != 0) {
    		result = result / 10 + 1;
    	} else {
    		result = result / 10;
    	}
    	return result;
	}
    
    @GetMapping("/review-max-new")
    @ResponseBody
	public int getReviewNewPage() {
		int result = service.getReviewNewPage();	
		if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
	}
    
    @GetMapping("/review-max-all")
    @ResponseBody
	public int getReviewAllPage() {
		int result = service.getReviewAllPage();	
		if(result % 5 != 0) {
    		result = result / 5 + 1;
    	} else {
    		result = result / 5;
    	}
    	return result;
	}
}

