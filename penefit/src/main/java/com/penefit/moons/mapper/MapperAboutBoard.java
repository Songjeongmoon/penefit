package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.ReplyVO;

@Mapper
public interface MapperAboutBoard {

	// 공지사항 리스트
	public List<NoticeVO> getNoticeList();

	// 공지사항 상세
	public NoticeVO noticeSelectOne(int notice_num);

	// 공지사항 조회수
	public void noticeViewCnt(int notice_num);

	// 공지사항 수정
	public void modiNotice(NoticeVO nvo);

	// 공지사항 삭제
	public int delNotice(@Param("notice_num") int notice_num);
	
//	//공지사항 페이징
//	public int getPaging(int page_num);
//		

	// -----------------------------------
	// 지역별 게시판 등록
	public int cityReg(BoardVO bvo);

	// 전체 지역 게시판
	public List<BoardVO> getCityList();

	// 각 지역별 게시판
	public List<BoardVO> getOneCityList(String check_city);
	
	
	//지역 게시판 검색
	public List<BoardVO> search_city(@Param("keyword") String keyword, @Param("city_code") String city_code);
	

	// 지역 게시판 상세보기
	public BoardVO citySelectOne(@Param("board_num") int board_num);

	// 지역 게시판 조회수
	public void cityViewCnt(int board_num);

	// City reply------------------------------------

	// 댓글등록
	public int reg_cityReply(ReplyVO crvo);

	// 댓글 리스트
	public List<ReplyVO> get_CityReplyList(@Param("board_num") int board_num);

	// 댓글삭제
	public int del_CityReply(@Param("reply_num") int reply_num);

	//Notice---------------------------------
	// 공지사항 수정
	public void modiCity(BoardVO bvo);

	// 공지사항 삭제
	public int delCity(@Param("board_num") int board_num);

	
	// FAQ게시판
	public List<BoardVO> getFaQList();

	// FAQ 상세
	public BoardVO getFaQselectOne(int board_num);

}
