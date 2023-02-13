package com.penefit.moons.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.WishlistVO;

public interface ServiceAboutClassI {

	// 전체 클래스 목록보기
	public ArrayList<ClassVO> getClassList();

	// 카테고리별 클래스 목록
	public ArrayList<ClassVO> getCtgClassList(String key);

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

	// 위시리스트 삭제
	public void deleteWishlist(WishlistVO wish);

	//위시리스트 목록
	public ArrayList<WishlistVO> getWishlist(String member_id);
	
	//동일한 제품코드가 장바구니에 있는지 확인
	public int checkCcodeInCart(String class_code, String member_id);
	
	//장바구니에 담기
	public void addShoppingcart(@Param(value = "cls") String class_code, String member_id);
	
	//장바구니 목록보기
	public ArrayList<CartVO> getShoppingcartList(String member_id);
}
