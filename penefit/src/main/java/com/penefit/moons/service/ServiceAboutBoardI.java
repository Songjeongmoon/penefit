package com.penefit.moons.service;

import java.util.List;

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

	//지역별 게시판
	
	
	//---------------------------------------
	
	//QnA 게시판
	public int qnaReg(QnAVO qvo);
	
	public List<QnAVO> qlist();
	
	public QnAVO qnaSelectOnt(int qna_num);

	//댓글(reply) 게시판
	public int replyReg(ReplyVO rvo);
	
	

}
