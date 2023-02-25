package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.ReplyVO;

public interface ServiceAboutBoardI {
	
	//공지사항 리스트 
	public List<NoticeVO> getpages(int startnum);
	
	//공지사항 상세
	public NoticeVO noticeSelectOne(int notice_num);
	
	//공지사항 수정
	public void modiNotice(NoticeVO nvo);
	
	//공지사항 삭제
	public int delNotice(int notice_num);
	
	
	//---------------------------------------

	//지역전체 게시판
	public List<BoardVO> getAllCityList(int pageNum);
	
	//각 지역별 리스트
	public List<BoardVO> getCityListOne(String check_city);
	
	//지역 상세조회
	public BoardVO citySelectOne(int board_num);
	
	//지역 게시판 등록 
	public int cityReg(BoardVO bvo);
	//지역 수정
	public void modiCity(BoardVO bvo);
	
	//지역 삭제
	public int delCity(int board_num);
	
	//지역 검색
	public List<BoardVO> searchCity(String keyword, String citysel);
	
	//지역 댓글
	//댓글(reply)등록  
	public int cityreplyReg(ReplyVO crvo);
	
	//댓글리스트
	public List<ReplyVO> get_CityRlist(int board_num);
	
	//댓글(reply) 삭제
	public int cityReplyDel(int reply_num);
	
	
	//FAQ 게시판
	public List<BoardVO> getFaQList();

	
	//---------------------------------------

	//공지사항 게시글 개수 
	public int countNotice();
	
	//지역 게시판 게시글 개수
	public int countCity();
	
	//지역게시판 리스트 & 페이징
	//public List<BoardVO> getAllCityList(int startnum);
	
	
	
	
	
	
}