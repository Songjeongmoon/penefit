package com.penefit.moons.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.WishlistVO;

@Mapper
public interface MapperAboutClass {

	//클래스목록조회
	public ArrayList<ClassVO> getClassList();
	
	//카테고리별 클래스 목록 조회
	public ArrayList<ClassVO> getCtgClassList(@Param(value = "key") String key);
	
	//신규클래스 조회
	public ArrayList<ClassVO> getNewClassList();
	
	//클래스 검색
	public ArrayList<ClassVO> getSearchClassList(@Param(value = "keyword") String keyword);
	
	//클래스 검색결과 수
	public int getSearchClassListCnt(@Param(value = "keyword") String keyword);
	
	//1개의 클래스 상세보기
	public ClassVO selectClassOne(@Param(value = "class_code") String class_code);

	//위시리스트 확인
	public int checkWishlist(@Param(value = "class_code")String class_code, @Param(value = "member_id")String member_id);
	
	//위시리스트 추가
	public void addWishlist(WishlistVO wish);
	
	//위시리스트 삭제
	public void deleteWishlist(WishlistVO wish);

	//위시리스트 목록조회
	public ArrayList<WishlistVO> getWishlist(@Param(value = "member_id") String member_id);

	//장바구니에 담기전, 동일 품목이 있는지 확인!
	public int checkCcodeInCart(@Param(value = "class_code") String param1,@Param(value = "member_id")  String param2);
	
	//장바구니에 담기
	public void addShoppingcart(@Param(value = "class_code") String param1,@Param(value = "member_id")  String param2);
	
	//장바구니 목록보기
	public ArrayList<CartVO> getShoppingcartList(String member_id);
	
	
}
