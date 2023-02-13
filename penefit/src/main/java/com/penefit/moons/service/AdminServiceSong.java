package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.AdminMapperSong;

@Service
public class AdminServiceSong implements AdminServiceSongIm{
	
	@Autowired
	AdminMapperSong mapper;
	
	@Override
	public SuggestDTO createClass(String suggest_num) {
		int cnt = 0;
		SuggestDTO suggest = mapper.getSuggestInfo(suggest_num);
		String[] code = mapper.getTypeCnt();
		for(int i = 0; i < code.length; i++) {
			if(code[i].charAt(0) == suggest.getType().charAt(0)) {
				System.out.println("code" + code[i].charAt(0));
				System.out.println("type" + suggest.getType().charAt(0));
				cnt++;
			}
		}
		cnt++;
		
		ClassVO classvo = new ClassVO();
		classvo.setSuggest_num(suggest.getSuggest_num());
		
		String time = suggest.getClass_time();
		time = time.replace("-", "");
		time = time.replace(":", "");
		time = time.replace(" ", "");
		
		classvo.setClass_code(suggest.getType() + cnt + suggest.getCity_code() + time);
		classvo.setCity_code(suggest.getCity_code());
		classvo.setClass_info(suggest.getSuggest_content());
		classvo.setClass_memlit(suggest.getMaxCnt());
		classvo.setSuggest_photo(suggest.getSuggest_photo());
		classvo.setClass_price(suggest.getPrice());
		classvo.setClass_subject(suggest.getSuggest_title());
		classvo.setClass_teacher(suggest.getMember_id());
		classvo.setClass_date(suggest.getClass_time());
		System.out.println(classvo);
		mapper.createClass(classvo);
		
		
		return suggest;
	}
	
}
