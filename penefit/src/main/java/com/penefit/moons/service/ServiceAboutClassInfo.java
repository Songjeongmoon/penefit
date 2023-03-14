package com.penefit.moons.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.penefit.moons.domain.ClassListDTO;
import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.mapper.MapperAboutClassInfo;

@Service
public class ServiceAboutClassInfo implements ServiceAboutClassInfoIm {

	@Autowired
	MapperAboutClassInfo mapper;

	@Override
	public int insertSuggestion(SuggestDTO suggest, MultipartHttpServletRequest files) {

		suggest.setSuggest_content(suggest.getTime() + "시간짜리 수업입니다 -" + suggest.getSuggest_content());
		String fileNames = "";
		List<MultipartFile> list = files.getFiles("files");
		String savePath = System.getProperty("user.dir") + "/src/main/webapp/images";

		for (int i = 0; i < list.size(); i++) {
			String[] uuids = UUID.randomUUID().toString().split("-");
			String extention = list.get(i).getOriginalFilename()
					.substring(list.get(i).getOriginalFilename().lastIndexOf(".") + 1);

			fileNames += i == 0 ? uuids[0] + "." + extention : "-" + uuids[0] + "." + extention;
			
			try {
				File saveFile = new File(savePath, uuids[0] + "." + extention);
				list.get(i).transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		suggest.setSuggest_photo(fileNames);
		int result = mapper.insertSuggestion(suggest);

		return result;
	}

	@Override
	public ArrayList<SuggestDTO> getMySuggestionList(String member_id, int pageNum) {
		ArrayList<SuggestDTO> list = mapper.getMySuggestionList(member_id, pageNum);
		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyClassList(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyClassList(member_id);

		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyClassListDayASC(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyClassListDayASC(member_id);
		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyEndClassList(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyEndClassList(member_id);
		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyActiveClassList(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyActiveClassList(member_id);
		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyClassListCnt(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyClassListCnt(member_id);
		return list;
	}

	@Override
	public ArrayList<ClassListDTO> getMyClassListCntAsc(String member_id) {
		ArrayList<ClassListDTO> list = mapper.getMyClassListCntAsc(member_id);
		return list;
	}

	@Override
	public List<ClassVO> getMyClassListPage(int pageNum, String member_id) {
		return mapper.getMyClassListPage(pageNum, member_id);
	}

	@Override
	public List<MemberVO> getMyCustomerList(String class_code) {
		return mapper.getMyCustomerList(class_code);
	}

	@Override
	public int getClassMaxPage(String member_id) {
		return mapper.getClassMaxPage(member_id);
	}

}
