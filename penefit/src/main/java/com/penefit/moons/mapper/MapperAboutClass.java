package com.penefit.moons.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.HistoryDTO;
import com.penefit.moons.domain.HistoryVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.ReviewVO;
import com.penefit.moons.domain.WishlistVO;

@Mapper
public interface MapperAboutClass {

	// 클래스목록조회
	public ArrayList<ClassVO> getClassList();

	// 카테고리별 클래스 목록 조회
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key);

	// 신규클래스 조회
	public ArrayList<ClassVO> getNewClassList();

	// 클래스 검색
	public ArrayList<ClassVO> getSearchClassList(@Param(value = "keyword") String keyword);

	// 클래스 검색결과 수
	public int getSearchClassListCnt(@Param(value = "keyword") String keyword);

	// 1개의 클래스 상세보기
	public ClassVO selectClassOne(@Param(value = "class_code") String class_code);

	// 위시리스트 확인
	public int checkWishlist(@Param(value = "class_code") String class_code,
			@Param(value = "member_id") String member_id);

	// 위시리스트 추가
	public void addWishlist(WishlistVO wish);

	// 위시리스트 삭제1
	public void deleteWishlist(@Param(value = "class_code") String param1, @Param(value = "member_id") String param2);

	// 위시리스트 삭제2
	public void deleteWishlist2(WishlistVO wish);

	// 위시리스트 목록조회
	public ArrayList<WishlistVO> getWishlist(@Param(value = "member_id") String member_id);

	// 장바구니에 담기전, 동일 품목이 있는지 확인!
	public int checkCcodeInCart(@Param(value = "class_code") String param1, @Param(value = "member_id") String param2);

	//장바구니 갯수세기
	public int checkCntInCart(String member_id);
	
	// 장바구니에 담기
	public void addShoppingcart(@Param(value = "class_code") String param1, @Param(value = "member_id") String param2);

	// 장바구니 목록보기
	public ArrayList<CartVO> getShoppingcartList(@Param(value = "member_id") String member_id);
	
	// 장바구니에서 삭제
	public void deleteFromCart(@Param(value = "shopping_cart_num")int shopping_cart_num);

	//장바구니에서 전체삭제
	public void deleteAllFromCart(String member_id);
	
	//장바구니용 회원정보
	public MemberVO getMemberInfo(String member_id);

	//히스토리에 추가
	public void addHistory(@Param(value = "history") HistoryDTO history, @Param(value = "member_id") String param1, @Param(value = "str") String param2);
	
	//클래스 정보얻기
	public String getClass(int shopping_cart_num);
	
	//얻은 클래스 정보로 개인 클래스리스트 업데이트
	public void addClassMember(@Param(value = "class_code")String class_code, @Param(value = "member_id") String member_id,@Param(value = "buy_history_num") int buy_history_num);
	
	//얻은 클래스 정보로 클래스 신청인원 업데이트
	public void updateClassMemcnt(String class_code);

	//히스토리 목록 조회
	public ArrayList<HistoryVO> getHistory(String member_id);

	//히스토리 상세보기
	public HistoryVO getOneHistory(@Param(value = "member_id")String member_id ,@Param(value = "buy_history_num")int buy_history_num);

	//클래스 취소
	public void cancelClass(String buy_history_num);

	//결제시 클래스 정보받아오기
	public int getOneHistory2(String merchant_uid);

	//취소시 수강인원감소
	public void delClassMember(String class_code);

	//결제했던 수업내역 받아오기
	public String getClassArr(String buy_history_num);

	//취소시 나의 클래스에서 삭제
	public void delClassList(@Param(value = "buy_history_num")String buy_history_num, @Param(value = "member_id")String member_id);

	//리뷰등록
	public void addReview(@Param(value = "buy_history_num") int buy_history_num, @Param(value = "review_photo") String review_photo,@Param(value = "class_code")String class_code, @Param(value = "review_content") String review_content,@Param(value = "member_id") String member_id,@Param(value = "score") Double class_score);

	// 스코어가 있는지 확인하기 
	public Double getScore(@Param("member_id") String member_id);
	
	//스코어가 있다면 업데이트
	public void updateScore(@Param(value = "score")Double score, @Param("member_id") String member_id);
	
	//스코어가 없다면 등록
	public void addScore(@Param(value = "score")Double score, @Param("member_id") String member_id);

	//선생님 id받아오기
	public String getTeacherId(String class_code);

	//상세보기에 출력할 리뷰
	public List<ReviewVO> getReview(String class_code);

	//중복리뷰 방지
	public int getReviewCheck(@Param(value = "class_code")String class_code,@Param(value = "member_id") String member_id,@Param(value = "buy_history_num") int buy_history_num);

	//마감기한이 지나지 않은 것
	public ArrayList<ClassVO> getClassList1();

	//진행중인 목록
	public ArrayList<ClassVO> getOngoingClassList();

	//마감된 목록
	public ArrayList<ClassVO> getExpiredClassList();

	//리뷰목록받아오기
	public ArrayList<ReviewVO> getReviewList(@Param(value = "member_id") String member_id);

	
}
