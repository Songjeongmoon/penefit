package com.penefit.moons.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.mapper.MapperAboutClass;

@Service
public class ServiceAboutClass implements ServiceAboutClassI {

	@Autowired
	MapperAboutClass mapper;

	@Override
	public ArrayList<ClassVO> getClassList() {
		ArrayList<ClassVO> list = mapper.getClassList();
		return list;

	}

	@Override
	public ArrayList<ClassVO> getCtgClassList(String key) {
		ArrayList<ClassVO> list = mapper.getCtgClassList(key);
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
	
	

}
