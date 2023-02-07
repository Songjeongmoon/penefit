package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.penefit.moons.domain.BoardVO;

@Mapper
public interface BoardMapper {
	
	//공지사항 리트트 
	public List<BoardVO> getNoticeList();

}
