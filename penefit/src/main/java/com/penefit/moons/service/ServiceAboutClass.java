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
	public ArrayList<ClassVO> getClassList(int startnum) {
		ArrayList<ClassVO> list = mapper.getClassList(startnum);
		//System.out.println("getClassList" + startnum);
		return list;
	}
	

	@Override
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key, @Param("startnum") int startnum) {
		
		ArrayList<ClassVO> list = mapper.getCtgClassList(key, startnum);
		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<ClassVO> getNewClassList() {
		ArrayList<ClassVO> list = mapper.getNewClassList();
		return list;
	}

	@Override
	public ArrayList<ClassVO> getSearchClassList(String keyword,int startnum) {
		ArrayList<ClassVO> list = mapper.getSearchClassList(keyword, startnum);
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

		// ??????????????? ??????
		mapper.addHistory(history, member_id, codeStr);
		int buy_history_num = mapper.getOneHistory2(history.getMerchant_uid());
		for (int i = 0; i < numArr.size(); i++) {
			// ????????? ????????????
			String class_code = mapper.getClass(numArr.get(i));
			// ?????? ????????? ????????? ?????? ?????????????????????, ????????? ???????????? ????????????
			mapper.addClassMember(class_code, member_id, buy_history_num);
			mapper.updateClassMemcnt(class_code);
			// ?????????????????? ????????????
			mapper.deleteFromCart(numArr.get(i));
		}

	}

	// ???????????? ????????????
	@Override
	public ArrayList<HistoryVO> getHistory(int pageNum, String member_id) {
		ArrayList<HistoryVO> list = mapper.getHistory(pageNum, member_id);
		return list;
	}

	// ???????????? ????????????
	@Override
	public HistoryVO getOneHistory(String member_id, int buy_history_num) {
		HistoryVO history = mapper.getOneHistory(member_id, buy_history_num);
		return history;
	}

	// ???????????? ??????
	@Override
	public void cancelClass(String buy_history_num, String member_id) {
		// ?????????????????? ????????? ????????????.
		mapper.cancelClass(buy_history_num);
		// ???????????? ????????? ?????? ????????????
		String str = mapper.getClassArr(buy_history_num);
		System.out.println("STR : " + str);
		String[] list = str.split("-");
		System.out.println(list);

		for (String class_code : list) {
			// ????????? ????????? -1
			mapper.delClassMember(class_code);
		}

		// ??????????????? ??????????????? ??????
		mapper.delClassList(buy_history_num, member_id);

	}

	// ????????????
	@Override
	public void addReview(int buy_history_num, String review_photo, String class_code, String review_content, String member_id, Double class_score) {
		mapper.addReview(buy_history_num, review_photo, class_code, review_content, member_id, class_score);
	}

	// ????????? ?????????
	@Override
	public Double getScore(String member_id) {
		Double result = mapper.getScore(member_id);
		return result;
	}

	// ????????? ????????? ????????????
	@Override
	public void updateScore(Double score, String member_id) {
		mapper.updateScore(score, member_id);
	}

	// ????????? ????????????
	@Override
	public void addScore(Double score, String member_id) {
		mapper.addScore(score, member_id);
	}

	// ????????? ??????
	@Override
	public String getTeacherId(String class_code) {
		String class_teacher = mapper.getTeacherId(class_code);
		return class_teacher;
	}

	// ?????? ??????
	@Override
	public List<ReviewVO> getReview(String class_code) {
		List<ReviewVO> list = mapper.getReview(class_code);
		return list;
	}

	// w?????? ???????????? ??????
	@Override
	public int getReviewCheck(String class_code, String member_id, int buy_history_num) {
		int result = mapper.getReviewCheck(class_code, member_id, buy_history_num);
		System.out.println(("service class_code : " + class_code));
		System.out.println(("service member_id : " + member_id));
		System.out.println(("service buy_history_num : " + buy_history_num));
		System.out.println(("service ?????? : " + result));
		return result;
	}

	// ???????????? ????????????
	@Override
	public int checkCntInCart(String member_id) {
		int result = mapper.checkCntInCart(member_id);
		return result;
	}

	// ??????????????? ????????? ?????? ??????
	@Override
	public ArrayList<ClassVO> getClassList1() {
		ArrayList<ClassVO> list = mapper.getClassList1();
		return list;
	}
	
	// ???????????? ?????? ????????????	---
	@Override
	public ArrayList<ClassVO> getOngoingClassList(int startnum) {
		ArrayList<ClassVO> list = mapper.getOngoingClassList(startnum);
		return list;
	}

	// ????????? ??????
	@Override
	public ArrayList<ClassVO> getExpiredClassList(int startnum) {
		ArrayList<ClassVO> list = mapper.getExpiredClassList(startnum);
		return list;
	}
	//????????????
	@Override
	public List<ReviewVO> getReviewList(String member_id, int pageNum) {
		ArrayList<ReviewVO> list = mapper.getReviewList(member_id,pageNum);
		return list;
	}

	@Override
	public void insertVisits() {
		mapper.insertVisits();
	}
	@Override
	public int historymaxPage(String member_id) {
		return mapper.historymaxPage(member_id);
	}
	@Override
	public int reviewmaxPage(String member_id) {
		return mapper.reviewmaxPage(member_id);
	}
	@Override
	public int suggestmaxPage(String member_id) {
		return mapper.suggestmaxPage(member_id);
	}
	@Override
	public int qnamaxPage(String member_id) {
		return mapper.qnamaxPage(member_id);
	}

	@Override
	public List<ClassVO> homenewlist() {
		return mapper.homenewlist();
	}
	@Override
	public List<ClassVO> homerecolist() {
		return mapper.homerecolist();
	}


	//???????????? class count ---
	@Override
	public int countOngingClass() {
		int result = mapper.countOngingClass();
		return result;
	}
	
	//?????? class count ---
	@Override
	public int countClass() {
		int result = mapper.countClass();
		return result;
	}

	//????????? ?????? count ----
	@Override
	public int expiredClassCount() {
		int result = mapper.expiredClassCount();
		return result;
	}

	
	//??????????????? class count
	@Override
	public int ctgClassCount(String key) {
		int result = mapper.ctgClassCount(key);
		System.out.println(result);
		System.out.println("!!!!!!!!!!!!!!!!!!!1");
		return result;
	}


	@Override
	public ReviewVO getReviewOne(int review_num) {
		ReviewVO rvo = mapper.getReviewOne(review_num);
		return rvo;
	}


	@Override
	public List<ReviewVO> getReviewList(String member_id) {
		List<ReviewVO> list = mapper.getReviewList(member_id, 0);
		return list;
	}


	@Override
	public ClassVO reviewCheck(String class_code) {
		return mapper.reviewCheck(class_code);
	}

	
	
	
	

	



}
