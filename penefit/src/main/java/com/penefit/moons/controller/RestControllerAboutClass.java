package com.penefit.moons.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
//github.com/eseo99/penefit.git
import org.springframework.web.bind.annotation.RestController;

import com.penefit.moons.domain.CartVO;
import com.penefit.moons.domain.HistoryDTO;
import com.penefit.moons.domain.HistoryVO;
import com.penefit.moons.domain.WishlistVO;
import com.penefit.moons.service.ServiceAboutClass;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RestControllerAboutClass {

	@Autowired
	ServiceAboutClass service;

	
	//class-detail페이지에 찜목록 확인
	@GetMapping("/checkWishlist")
	public int checkWishlist(@RequestParam String class_code, @RequestParam String member_id) {
		int result = service.checkWishlist(class_code, member_id);
		return result;
	}

	//class-detail페이지에서 추가
	@PostMapping("/addWishlist")
	public void addWishlist(@RequestBody WishlistVO wish) {
		service.addWishlist(wish);

	}

	//class-detail페이지에서 삭제
	@DeleteMapping("/deleteWishlist/class-code/{class_code}")
	public void deleteWishlist(@PathVariable(value = "class_code") String class_code, HttpSession session) {
		String member_id=(String) session.getAttribute("member_id");
		service.deleteWishlist(class_code, member_id);
	}


	//위시리시트 페이지에서 삭제
	@DeleteMapping("/wishlist2")
	public void wishlistOut(HttpSession session, @RequestParam int wishNum) {
		WishlistVO wish = new WishlistVO();
		String member_id = (String) session.getAttribute("member_id");
		wish.setWishlist_num(wishNum);
		wish.setMember_id(member_id);
		service.deleteWishlist2(wish);
	}
	
	// 위시리스트 목록
	@GetMapping("/wishlist3")
	public ArrayList<WishlistVO> goWishlist2(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<WishlistVO> list = service.getWishlist(member_id);
		return list;
	}
	
	//장바구니 리스트
	@GetMapping("/shoppingcartList")
	public ArrayList<CartVO> shoppingcartList(HttpSession session,Model model) throws Exception {
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<CartVO> list = service.getShoppingcartList(member_id);
		for(int i=0;i<list.size();i++ ) {
			LocalDateTime now = LocalDateTime.now();
			 String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = dateFormat.parse(list.get(i).getClass_date());
			Date date2 = dateFormat.parse(formatedNow);
			if(date1.before(date2)){
				list.get(i).setStatusMsg("마감");
			} else {
				list.get(i).setStatusMsg("진행");
	        }
		}
		return list;
	}
	
	//장바구니에서 전체삭제
	@DeleteMapping("/allCart")
	public void deleteAllCart(HttpSession session ) {
		String member_id = (String) session.getAttribute("member_id");
		service.deleteAllFromCart(member_id);
	}
	
	
	//장바구니에서 삭제
	@DeleteMapping("/deleteCart/shopping-cart-num/{shopping_cart_num}")
	public void deleteCart(@PathVariable(value = "shopping_cart_num") int cartNum) {
		service.deleteFromCart(cartNum);
	}
	
	//구매내역에 추가
	@PostMapping("/hitory")
	public void addHistory(@RequestBody HistoryDTO history, HttpSession session ) {
		//history에 넣기
		String member_id = (String) session.getAttribute("member_id");
		service.addHistory(history, member_id);
	}
	
	//구매내역 받아오기
	@GetMapping("/historyList")
	public ArrayList<HistoryVO> getHistory(HttpSession session){
		String member_id = (String) session.getAttribute("member_id");
		ArrayList<HistoryVO> list = service.getHistory(member_id);
		return list;
	}
	
	//구매 상세내역
	@GetMapping("/OneHistory/buy_history_num/{buy_history_num}")
	public HistoryVO getOneHistory(HttpSession session, @PathVariable int buy_history_num ) {
		String member_id = (String) session.getAttribute("member_id");
		HistoryVO history = service.getOneHistory(member_id, buy_history_num);
		return history;
		
	}
	
	//구매취소
	@DeleteMapping("noClass/buy_history_num/{buy_history_num}")
	public void cancelClass(@PathVariable String buy_history_num, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		service.cancelClass(buy_history_num, member_id);
	}
	
	//중복된 리뷰인지 확인하기 위해 클래스 리뷰받기
	@GetMapping("/classAndReviewList")
	public List<String> classAndReviewList(HttpSession session, String class_code) {
		log.info("================class_code =========" + class_code);
		String member_id = (String) session.getAttribute("member_id");
		List<String> result = service.getReviewCheck(class_code, member_id);
		log.info("================result =========" + result);
		return result;
	}
}
