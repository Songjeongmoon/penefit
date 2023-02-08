package com.penefit.moons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.mapper.MapperAboutBoard;

@Service
public class ServiceAboutBoard implements ServiceAboutBoardI {
	
	@Autowired
	MapperAboutBoard bmapper;

	@Override
	public List<BoardVO> getNoticeList() {		//공지사항리스트 
		
		List<BoardVO> blist = bmapper.getNoticeList();
		
		return blist;
	}

		
	


	

}
