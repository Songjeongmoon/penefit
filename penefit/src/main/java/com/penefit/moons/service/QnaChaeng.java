package com.penefit.moons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;
import com.penefit.moons.mapper.QnaChaengMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaChaeng implements QnaChaengI{

	@Autowired 
	QnaChaengMapper mapper;
	
	@Override
	public void regQna(QnAVO qna) {
		mapper.regQna(qna);
		
	}
	@Override
	public List<QnAVO> getQnaList(String member_id) {
		List<QnAVO> list = mapper.getQnaList(member_id);
		return list;
	}
	@Override
	public QnAVO qnaOneList(String member_id, int qna_num) {
		QnAVO q = mapper.qnaOneList(member_id, qna_num);
		return q;
	}
	@Override
	public String getQnaReply(int qna_num) {
		String r = mapper.getQnaReply(qna_num);
		return r;
	}

	
	
}
