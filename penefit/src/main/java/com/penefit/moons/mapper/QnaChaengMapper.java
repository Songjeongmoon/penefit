package com.penefit.moons.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.ReplyVO;

@Mapper
public interface QnaChaengMapper {

	public void regQna(QnAVO qna);
	
	public List<QnAVO> getQnaList(String member_id);

	public QnAVO qnaOneList(@Param("member_id")String member_id,@Param("qna_num") int qna_num);

	public String getQnaReply(@Param("qna_num") int qna_num);
	
}
