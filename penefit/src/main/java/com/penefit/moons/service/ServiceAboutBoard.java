package com.penefit.moons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.mapper.MapperAboutBoard;

@Service

public class ServiceAboutBoard implements ServiceAboutBoardI {
	
	@Autowired
	MapperAboutBoard bmapper;

	@Override		//공지사항리스트
	public List<NoticeVO> getNoticeList() {		 
		
		List<NoticeVO> nlist = bmapper.getNoticeList();
		
		return nlist;
	}

	@Override		//공지사항상세보기
	public NoticeVO noticeSelectOne(int notice_num) {  
		
		bmapper.noticeViewCnt(notice_num);
		NoticeVO nvo = bmapper.noticeSelectOne(notice_num);
		return nvo;
	}
	
	
	@Override		//공지사항 수정
	public void modiNotice(NoticeVO nvo) {
		
		bmapper.modiNotice(nvo);
	}

	@Override		//공지사항 삭제
	public int delNotice(int notice_num) {		
		int result = bmapper.delNotice(notice_num);
		
		return result;
	}
	
	//전체 지역 게시판 리스트
	@Override
	public List<BoardVO> getCitylist() {
		List<BoardVO> clist = bmapper.getCityList();
		return clist;
	}
	
	//각 지역 게시판 리스트
	@Override
	public List<BoardVO> getCityListOne(String check_city) {
		List<BoardVO> oneCList = bmapper.getOneCityList(check_city);
		return oneCList;
	}
	
	//지역게시판 상세보기
	@Override
	public BoardVO citySelectOne(int board_num) {
		bmapper.cityViewCnt(board_num);
		BoardVO cvo = bmapper.citySelectOne(board_num);
		return cvo;
	}
	
	//지역 게시판 등록
	@Override
	public int cityReg(BoardVO bvo) {
		int result = bmapper.cityReg(bvo);
		return result;
	}
	
	//지역 게시판 검색
	@Override
	public List<BoardVO> searchCity(String keyword, String citysel) {
		List<BoardVO> list = bmapper.search_city(keyword, citysel);
		
		return list;
	}

	@Override
	public void modiCity(BoardVO bvo) {
		System.out.println(bvo);
		bmapper.modiCity(bvo);
	}

	@Override
	public int delCity(int board_num) {
		int result = bmapper.delCity(board_num);
		return result;
	}
	
	
	@Override
	public int cityreplyReg(ReplyVO rvo) {
		int result = bmapper.reg_cityReply(rvo);
		return result;
	}
	//city 댓글
	@Override
	public List<ReplyVO> get_CityRlist(int board_num) {
		List<ReplyVO> crList = bmapper.get_CityReplyList(board_num);
		return crList;
	}
	
	@Override
	public int cityReplyDel(int reply_num) {
		int result = bmapper.del_CityReply(reply_num);
		return result;
	}

	@Override
	public List<BoardVO> getFaQList() {
		List<BoardVO> flist = bmapper.getFaQList();
		return flist;
	}

	public BoardVO faqSelectOne(int board_num) {
		BoardVO faq = bmapper.getFaQselectOne(board_num);
		return faq;
	}

}
