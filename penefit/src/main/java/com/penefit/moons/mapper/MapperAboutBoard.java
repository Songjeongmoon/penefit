package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	public void cityReg(NoticeVO nvo);
	
	
	//QnA-------------------------------------
	
	//QnA 등록
	public int regQnA(QnAVO qna);
	
	//QnA 리스트
	public List<QnAVO> getQnAList();
	
	//QnA 상세조회
	public QnAVO qnaSelectOne(@Param("qna_num") int qna_num);
	
	
	//댓글등록
	public int regReply(ReplyVO rvo);

}
