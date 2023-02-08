package com.penefit.moons.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.mapper.MapperAboutMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ServiceAboutMember implements ServiceAboutMemberI {

	@Autowired
	MapperAboutMember mapper;
	// mapper선언

	@Override
	public String regMember(MemberVO member) {
		int result = mapper.regMember(member);

		if (result == 1) {
			return "home";
		} else {
			return "regMember";
		}

	}

	@Override
	public int idCheck(String id) {
		System.out.println("service의 id : " + id);
		int result = mapper.idCheck(id);
		System.out.println("--------------------------" + result);
		log.info("================================================");
		return result;
	}

}

