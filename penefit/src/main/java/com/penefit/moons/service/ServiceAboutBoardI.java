package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;

public interface ServiceAboutBoardI {
	
	//공지사항 리스트 
	public List<NoticeVO> getNoticeList();
	
	//공지사항 상세
	public NoticeVO noticeSelectOne(int notice_num);
	
	//공지사항 수정
	public void modiNotice(NoticeVO nvo);
	
	//공지사항 삭제
	public int delNotice(int notice_num);
	
	//---------------------------------------

	//지역전체 게시판
	public List<BoardVO> getCitylist();
	
	//각 지역별 리스트
	public List<BoardVO> getCityListOne(String check_city);
	
	//---------------------------------------
	
	//QnA 게시판
	public int qnaReg(QnAVO qvo);
	
	public List<QnAVO> qlist();
	
	public QnAVO qnaSelectOne(int qna_num);
	
	public void modiQnA(QnAVO qvo);
	
	public int delQnA(int qna_num);

	//댓글(reply)등록  
	public int replyReg(ReplyVO rvo);
	
	//댓글리스트
	public List<ReplyVO> getRlist(int qna_num);
	
	//댓글(reply) 삭제
	public int replyDel(int reply_num);
	
	
	//FAQ 게시판
	public List<BoardVO> getFaQList();

	

}
