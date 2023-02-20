package com.penefit.moons.service;

import java.util.List;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;

public interface QnaChaengI {

	//qna등록
	public void regQna(QnAVO qna);

	public List<QnAVO> getQnaList(String member_id);

	public QnAVO qnaOneList(String member_id, int qna_num);

	public String getQnaReply(int qna_num);

}
