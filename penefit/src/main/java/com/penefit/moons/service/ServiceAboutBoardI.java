package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.BoardVO;

public interface ServiceAboutBoardI {
	
	//공지사항 리스트 
	public List<BoardVO> getNoticeList();
	
	//공지사항 상세
	public BoardVO noticeSelectOne(int board_num);
	
	

}
