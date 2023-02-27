package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.HistoryDTO;
import com.penefit.moons.domain.HistoryVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.mapper.MapperAboutClass;

@Service
public class ServiceAboutClass implements ServiceAboutClassI {

	@Autowired
	MapperAboutClass mapper;

	@Override
	public ArrayList<ClassVO> getClassList(int pageNum) {
		ArrayList<ClassVO> list = mapper.getClassList(pageNum);
		System.out.println("getClassList" + pageNum);
		return list;
	}
	

	@Override
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key, @Param("pageNum") int pageNum) {
		System.out.println("key : " + key + "그리고" + "pageNum : " + pageNum);
		ArrayList<ClassVO> list = mapper.getCtgClassList(key, pageNum);
		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<ClassVO> getNewClassList() {
		ArrayList<ClassVO> list = mapper.getNewClassList();
		return list;
	}

	@Override
	public ArrayList<ClassVO> getSearchClassList(String keyword) {
		ArrayList<ClassVO> list = mapper.getSearchClassList(keyword);
		return list;
	}

	@Override
	public int getSearchClassListCnt(String keyword) {
		int result = mapper.getSearchClassListCnt(keyword);
		return result;
	}

	@Override
	public ClassVO selectClassOne(String class_code) {
		ClassVO cvo = mapper.selectClassOne(class_code);
		System.out.println(("service.cvo==========" + cvo.toString()));
		return cvo;
	}

	@Override
	public int checkWishlist(String class_code, String member_id) {
		int result = mapper.checkWishlist(class_code, member_id);
		return result;
	}

	@Override
	public void addWishlist(WishlistVO wish) {
		mapper.addWishlist(wish);
	}

	@Override
	public void deleteWishlist(String class_code, String member_id) {
		mapper.deleteWishlist(class_code, member_id);
	}

	@Override
	public void deleteWishlist2(WishlistVO wish) {
		mapper.deleteWishlist2(wish);
	}

	@Override
	public ArrayList<WishlistVO> getWishlist(String member_id) {
		ArrayList<WishlistVO> list = mapper.getWishlist(member_id);
		return list;
	}

	@Override
	public void addShoppingcart(String class_code, String member_id) {
		mapper.addShoppingcart(class_code, member_id);
	}

	@Override
	public ArrayList<CartVO> getShoppingcartList(String member_id) {
		ArrayList<CartVO> list = mapper.getShoppingcartList(member_id);
		return list;
	}

	@Override
	public int checkCcodeInCart(String class_code, String member_id) {
		int result = mapper.checkCcodeInCart(class_code, member_id);
		return result;
	}

	@Override
	public void deleteFromCart(int shopping_cart_num) {
		mapper.deleteFromCart(shopping_cart_num);

	}

	@Override
	public void deleteAllFromCart(String member_id) {
		mapper.deleteAllFromCart(member_id);
	}

	@Override
	public MemberVO getMemberInfo(String member_id) {
		MemberVO member = mapper.getMemberInfo(member_id);
		return member;
	}

	@Override
	public void addHistory(HistoryDTO history, String member_id) {
		List<Integer> numArr = history.getClass_arr();
		String numStr = "";
		List<String> codeArr = history.getClassCode_arr();
		String codeStr = "";
		for (int i = 0; i < numArr.size(); i++) {
			numStr += numArr.get(i) + "-";
			codeStr += codeArr.get(i) + "-";
		}

		// 히스토리에 추가
		mapper.addHistory(history, member_id, codeStr);
		int buy_history_num = mapper.getOneHistory2(history.getMerchant_uid());
		for (int i = 0; i < numArr.size(); i++) {
			// 클래스 정보얻기
			String class_code = mapper.getClass(numArr.get(i));
			// 얻은 클래스 정보로 개인 클래스리스트와, 클래스 신청인원 업데이트
			mapper.addClassMember(class_code, member_id, buy_history_num);
			mapper.updateClassMemcnt(class_code);
			// 장바구니에서 삭제하기
			mapper.deleteFromCart(numArr.get(i));
		}

	}

	// 히스토리 목록조회
	@Override
	public ArrayList<HistoryVO> getHistory(String member_id) {
		ArrayList<HistoryVO> list = mapper.getHistory(member_id);
		return list;
	}

	// 히스토리 상세조회
	@Override
	public HistoryVO getOneHistory(String member_id, int buy_history_num) {
		HistoryVO history = mapper.getOneHistory(member_id, buy_history_num);
		return history;
	}

	// 구매내역 취소
	@Override
	public void cancelClass(String buy_history_num, String member_id) {
		// 구매내역에서 취소로 변경한다.
		mapper.cancelClass(buy_history_num);
		// 결제했던 클래스 배열 받아오기
		String str = mapper.getClassArr(buy_history_num);
		System.out.println("STR : " + str);
		String[] list = str.split("-");
		System.out.println(list);

		for (String class_code : list) {
			// 클래스 인원수 -1
			mapper.delClassMember(class_code);
		}

		// 나의클래스 리스트에서 삭제
		mapper.delClassList(buy_history_num, member_id);

	}

	// 리뷰등록
	@Override
	public void addReview(int buy_history_num, String review_photo, String class_code, String review_content, String member_id, Double class_score) {
		mapper.addReview(buy_history_num, review_photo, class_code, review_content, member_id, class_score);
	}

	// 점수를 찾아서
	@Override
	public Double getScore(String member_id) {
		Double result = mapper.getScore(member_id);
		return result;
	}

	// 점수가 있으면 업데이트
	@Override
	public void updateScore(Double score, String member_id) {
		mapper.updateScore(score, member_id);
	}

	// 없으면 채워넣기
	@Override
	public void addScore(Double score, String member_id) {
		mapper.addScore(score, member_id);
	}

	// 선생님 이름
	@Override
	public String getTeacherId(String class_code) {
		String class_teacher = mapper.getTeacherId(class_code);
		return class_teacher;
	}

	// 리뷰 보기
	@Override
	public List<ReviewVO> getReview(String class_code) {
		List<ReviewVO> list = mapper.getReview(class_code);
		System.out.println("REVIEW =====================" + list);
		return list;
	}

	// w리뷰 중복방지 확인
	@Override
	public int getReviewCheck(String class_code, String member_id, int buy_history_num) {
		int result = mapper.getReviewCheck(class_code, member_id, buy_history_num);
		System.out.println(("service class_code : " + class_code));
		System.out.println(("service member_id : " + member_id));
		System.out.println(("service buy_history_num : " + buy_history_num));
		System.out.println(("service 결과 : " + result));
		return result;
	}

	// 장바구니 갯수세기
	@Override
	public int checkCntInCart(String member_id) {
		int result = mapper.checkCntInCart(member_id);
		return result;
	}

	// 마감기한이 지나지 않은 목록
	@Override
	public ArrayList<ClassVO> getClassList1() {
		ArrayList<ClassVO> list = mapper.getClassList1();
		return list;
	}
	
	// 진행중인 목록 페페이징	---
	@Override
	public ArrayList<ClassVO> getOngoingClassList(int pageNum) {
		ArrayList<ClassVO> list = mapper.getOngoingClassList(pageNum);
		return list;
	}

	// 마감된 목록
	@Override
	public ArrayList<ClassVO> getExpiredClassList(int startNum) {
		ArrayList<ClassVO> list = mapper.getExpiredClassList(startNum);
		return list;
	}
	//리뷰목록
	@Override
	public List<ReviewVO> getReviewList(String member_id) {
		ArrayList<ReviewVO> list = mapper.getReviewList(member_id);
		return list;
	}

	@Override
	public void insertVisits() {
		mapper.insertVisits();
	}

	//진행중인 class count ---
	@Override
	public int countOngingClass() {
		int result = mapper.countOngingClass();
		return result;
	}
	
	//전체 class count ---
	@Override
	public int countClass() {
		int result = mapper.countClass();
		return result;
	}

	//마감된 강의 count ----
	@Override
	public int expiredClassCount() {
		int result = mapper.expiredClassCount();
		return result;
	}

	
	//카테고리별 class count
	@Override
	public int ctgClassCount() {
		int result = mapper.ctgClassCount();
		return result;
	}

	
	
	
	

	



}
