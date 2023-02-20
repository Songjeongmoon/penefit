package com.penefit.moons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.BoardVO;
import com.penefit.moons.domain.NoticeVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.mapper.MapperAboutBoard;

@Service

public class ServiceAboutBoard implements ServiceAboutBoardI {
	
	@Autowired
	MapperAboutBoard bmapper;

	@Override		//공지사항리스트
	public List<NoticeVO> getNoticeList() {		 
		
		List<NoticeVO> nlist = bmapper.getNoticeList();
		
		return nlist;
	}

	@Override		//공지사항상세보기
	public NoticeVO noticeSelectOne(int notice_num) {  
		
		bmapper.noticeViewCnt(notice_num);
		NoticeVO nvo = bmapper.noticeSelectOne(notice_num);
		return nvo;
	}
	
	
	@Override		//공지사항 수정
	public void modiNotice(NoticeVO nvo) {
		System.out.println(nvo);
		bmapper.modiNotice(nvo);
	}

	@Override		//공지사항 삭제
	public int delNotice(int notice_num) {		
		int result = bmapper.delNotice(notice_num);
		
		return result;
	}
	
	//전체 지역 게시판 리스트
	@Override
	public List<BoardVO> getCitylist() {
		List<BoardVO> clist = bmapper.getCityList();
		return clist;
	}
	
	//각 지역 게시판 리스트
	@Override
	public List<BoardVO> getCityListOne(String check_city) {
		List<BoardVO> oneCList = bmapper.getOneCityList(check_city);
		return oneCList;
	}

	@Override		//qna등록
	public int qnaReg(QnAVO qvo) {
		
		int result = bmapper.regQnA(qvo);
		return result;
	}

	@Override
	public List<QnAVO> qlist() {
		List<QnAVO> qlist = bmapper.getQnAList();
		return qlist;
	}

	@Override
	public QnAVO qnaSelectOne(int qna_num) {
		QnAVO qna = bmapper.qnaSelectOne(qna_num);
		return qna;
	}
	
	@Override
	public void modiQnA(QnAVO qvo) {
		bmapper.modiQnA(qvo);
		
	}

	@Override
	public int delQnA(int qna_num) {
		int result = bmapper.delQnA(qna_num);
		return result;
	}

	@Override
	public int replyReg(ReplyVO rvo) {
			int result = bmapper.regReply(rvo);
		return result;
	}

	@Override
	public List<ReplyVO> getRlist(int qna_num) {
		List<ReplyVO> rList = bmapper.getReplyList(qna_num);
		return rList;
	}
	
	@Override
	public int replyDel(int reply_num) {
		int result = bmapper.delReply(reply_num);
		return result;
	}

	@Override
	public List<BoardVO> getFaQList() {
		List<BoardVO> flist = bmapper.getFaQList();
		return flist;
	}

	public BoardVO faqSelectOne(int board_num) {
		BoardVO faq = bmapper.getFaQselectOne(board_num);
		return faq;
	}


	

	
	




	

	

	

	

	



	

	


	
	

		
	


	

}
