package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;
@Mapper
public interface MapperAboutBoard {
	
	//공지사항 리스트 
	public List<NoticeVO> getNoticeList();	
	
	//공지사항 상세
	public NoticeVO noticeSelectOne(int notice_num);
	
	//공지사항 조회수
	public void noticeViewCnt(int notice_num);
	
	//공지사항 수정
	public void modiNotice(NoticeVO nvo);
	
	//공지사항 삭제
	public int delNotice(@Param("notice_num") int notice_num);
	
	//-----------------------------------
	//지역별 게시판 등록
	public void cityReg(BoardVO bvo);
	
	//전체 지역 게시판
	public List<BoardVO> getCityList();
	
	//각 지역별 게시판 
	public List<BoardVO> getOneCityList(String check_city);
	
	
	
	
	
	//QnA-------------------------------------
	
	//QnA 등록
	public int regQnA(QnAVO qna);
	
	//QnA 리스트
	public List<QnAVO> getQnAList();
	
	//QnA 상세조회
	public QnAVO qnaSelectOne(@Param("qna_num") int qna_num);
	
	//QnA수정
	public int modiQnA(QnAVO qvo);
	//QnA 삭제
	public int delQnA(@Param("qna_num") int qna_num);
	
	//reply------------------------------------
	
	//댓글등록
	public int regReply(ReplyVO rvo);

	//댓글 리스트
	public List<ReplyVO> getReplyList(@Param("qna_num") int qna_num);
	
	//댓글삭제
	public int delReply(@Param("reply_num") int reply_num);
	
	
	//FAQ게시판
	public List<BoardVO> getFaQList();
	
	//FAQ 상세
	public BoardVO getFaQselectOne(int board_num);
	
}
