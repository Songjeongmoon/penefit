package com.penefit.moons.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.AdminMapperSong;

@Service
public class AdminServiceSong implements AdminServiceSongIm{
	
	@Autowired
	AdminMapperSong mapper;
	
	@Override
	public int createClass(int suggest_num) {
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
		int result = mapper.createClass(classvo);

		return result;
	}

	@Override
	public String updateClass(ClassVO classvo, MultipartHttpServletRequest files) {
		
		if(files != null) {
			String savePath = System.getProperty("user.dir") + "/src/main/webapp/images";

			String[] deleteFile = classvo.getSuggest_photo().split("-");
			for(int i = 0; i < deleteFile.length; i++) {
				File file = new File(savePath + "/" + deleteFile[i]);
				if(file.exists()) {
					file.delete();
				}
			}
			
			String fileName = "";
			String uuid = "";
			List<MultipartFile> list = files.getFiles("files");
			String name = "";
			String[] uuids = UUID.randomUUID().toString().split("-");
			
			for(int i = 0; i < uuids.length; i++) {
				uuid += uuids[i];				
			}
			for(int i = 0; i < list.size(); i++) {
				
				name = list.get(i).getOriginalFilename();
				String[] names = name.split("-");
				name = "";
				for(int j = 0; j < names.length; j++) {
					name += names[j];					
				}
				if(i == 0) {
					fileName += uuid + name;					
				} else {
					fileName += "-" + uuid + name;
				}
				
				
				try {
					File saveFile = new File(savePath, uuid + name);
					list.get(i).transferTo(saveFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			classvo.setSuggest_photo(fileName);
			
		}
		
		String val = "";
		int result = mapper.updateClass(classvo);
		if(result == 1) {
			val = "수정 완료";
		} else {
			val = "수정 실패";
		}
		return val;
	}

	
	
	@Override
	public String deleteClass(String class_code) {
		String val = "";
		int result = mapper.deleteClass(class_code);
		
		if(result == 1) {
			val = "삭제 완료";
		} else {
			val = "삭제 실패";
		}
		
		return val;
	}

	@Override
	public List<ClassVO> getClassList(String status, String keyword, int startNum) {
		if(status.equals("desc")) {
			return mapper.getClassList(keyword, startNum);
		} else if(status.equals("active")) {
			return mapper.getClassListActive(keyword, startNum);
		} else if(status.equals("end")) {
			return mapper.getClassListEnd(keyword, startNum);			
		} else {
			return mapper.getClassListASC(keyword, startNum);			
		}
	}

	@Override
	public List<ClassVO> searchClass(String class_subject) {
		List<ClassVO> list = mapper.searchClass(class_subject);
		return list;
	}

	@Override
	public List<SuggestDTO> getSuggestionList() {
		return mapper.getSuggestionList();
	}

	@Override
	public SuggestDTO getSuggestionInfo(int suggest_num) {
		return mapper.getSuggestInfo(suggest_num);
		
		
	}

	@Override
	public ClassVO getClassOne(String class_code) {
		ClassVO vo = mapper.getClassOne(class_code);
		return vo;
	}

	@Override
	public int rejectSuggestion(int suggest_num, String reject_reason) {
		return mapper.rejectSuggestion(suggest_num, reject_reason);
	}

	@Override
	public List<ClassVO> classListSearch(String keyword) {
		return mapper.classListSearch(keyword);
	}

	@Override
	public void approveSuggestion(int suggest_num) {
		 mapper.approveSuggestion(suggest_num);		
	}
	
	
	
	

	
}