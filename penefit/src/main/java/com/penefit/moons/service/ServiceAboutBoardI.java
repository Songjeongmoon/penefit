package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.BoardVO;

public interface ServiceAboutBoardI {
	
	//공지사항 리스트 
	public List<BoardVO> getNoticeList();
	
	

}
