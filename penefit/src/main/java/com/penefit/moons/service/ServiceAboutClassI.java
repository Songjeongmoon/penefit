package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.HistoryDTO;
import com.penefit.moons.domain.HistoryVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.WishlistVO;

public interface ServiceAboutClassI {
	//전체 클래서 count---
	public int countClass();
	
	// 전체 클래스 목록보기	----
	public ArrayList<ClassVO> getClassList(int pageNum);
	
	//카테고리별 클래스 count
	public int ctgClassCount(String key);
	
	// 카테고리별 클래스 목록
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key, @Param("pageNum") int pageNum);

	// 신규 클래스 목록
	public ArrayList<ClassVO> getNewClassList();

	// 검색된 클래스 목록
	public ArrayList<ClassVO> getSearchClassList(String keyword);

	// 검색된 클래스 갯수
	public int getSearchClassListCnt(String keyword);

	// 클래스 상세보기
	public ClassVO selectClassOne(String class_code);

	// 위시리스트 확인
	public int checkWishlist(String class_code, String member_id);

	// 위시리스트 추가
	public void addWishlist(WishlistVO wish);

	// 위시리스트 삭제1
	public void deleteWishlist(String class_code, String member_id);

	// 위시리스트 삭제2
	public void deleteWishlist2(WishlistVO wish);

	// 위시리스트 목록
	public ArrayList<WishlistVO> getWishlist(String member_id);

	// 동일한 제품코드가 장바구니에 있는지 확인
	public int checkCcodeInCart(String class_code, String member_id);

	//장바구니 갯수세기
	public int checkCntInCart(String member_id);
	
	// 장바구니에 담기
	public void addShoppingcart(@Param(value = "cls") String class_code, String member_id);

	// 장바구니 목록보기
	public ArrayList<CartVO> getShoppingcartList(String member_id);

	// 장바구니에서 삭제
	public void deleteFromCart(int shopping_cart_num);

	// 장바구니에서 전체삭제
	public void deleteAllFromCart(String member_id);

	// 장바구니용 회원정보
	public MemberVO getMemberInfo(String member_id);

	// 히스토리에 추가
	public void addHistory(HistoryDTO history, String member_id);


	// 히스토리 상세조회
	public HistoryVO getOneHistory(String member_id, int buy_history_num);

	// 클래스 취소
	void cancelClass(String buy_history_num, String member_id);

	// 리뷰등록
	public void addReview(int buy_history_num, String review_photo, String class_code, String review_content, String member_id,  Double class_score);

	// 스코어가 있는지 확인하기
	public Double getScore(String member_id);

	// 스코어가 있다면 업데이트
	public void updateScore(Double class_score, String member_id);

	// 스코어가 없다면 등록
	public void addScore(Double class_score, String member_id);

	//선생님 정보
	public String getTeacherId(String class_code);

	//상세보기에 출력할 후기 목록
	public List<ReviewVO> getReview(String class_code);
	
	//상세보기 후기 하나
	public ReviewVO getReviewOne(int review_num);

	//마감기간이 지나지 않은 목록
	public ArrayList<ClassVO> getClassList1();

	//진행중인 클래스 count ----
	public int countOngingClass();
	
	//진행중인 목록	----
	public ArrayList<ClassVO> getOngoingClassList(int pageNum);
	
	
	//마감된 강의 count---
	public int expiredClassCount();
	
	//마감된 목록
	public ArrayList<ClassVO> getExpiredClassList(int pageNum);
	
	//리뷰목록
	public List<ReviewVO> getReviewList(String member_id);


	public int getReviewCheck(String class_code, String member_id, int buy_history_num);
	
	public void insertVisits();

	public ArrayList<HistoryVO> getHistory(int pageNum, String member_id);

	public int historymaxPage(String member_id);

	public List<ReviewVO> getReviewList(String member_id, int pageNum);

	public int reviewmaxPage(String member_id);

	public int suggestmaxPage(String member_id);

	public int qnamaxPage(String member_id);

	public List<ClassVO> homenewlist();

	public List<ClassVO> homerecolist();


}
