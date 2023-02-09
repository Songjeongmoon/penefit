package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.BoardVO;
@Mapper
public interface MapperAboutBoard {
	
	//공지사항 리스트 
	public List<BoardVO> getNoticeList();	
	
	//공지사항 상세
	public BoardVO noticeSelectOne(int board_num);
	
	//공지사항 조회수
	public void noticeViewCnt(int board_num);
	

}
