package com.penefit.moons.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;

@Mapper
public interface AdminMapperChaeng {

	//관리자 화면의 qna 목록
	public List<QnAVO> getAdminQnaList();

	//관리자 화면 필터링 qna
	public List<QnAVO> getAdminQnaWithFilter(String filterKey);

	//관리자 화면 qna 상세보기
	public QnAVO adminQnaDetail(int qnaNum);
	
	//답변 등록하기
	public void regReplyforQna(@Param("String") String param1,@Param("adminid") String param2,@Param("qnanum") int param3);

	//qna 상태변경
	public void changeQnaStatus(@Param("qnanum") int param1);

	//상세보기에 답변표시
	public String replyofQna(@Param("qnaNum") int param1);
	
	
}
