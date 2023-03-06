package com.penefit.moons.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

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
         return "/member/regComplete";
      } else {
         return "/member/regMember";
      }

   }

   @Override
   public int idCheck(String id) {
      int result = mapper.idCheck(id);
      return result;
   }

   @Override
   public int loginCheck(@ModelAttribute("member_id")String member_id, @ModelAttribute("member_pw")String member_pw, HttpSession session) {
   
      ArrayList<MemberVO>list = mapper.loginCheck();
      
      for(int i = 0 ; i<list.size();i++) {
         if(list.get(i).getMember_id().equals(member_id)&&list.get(i).getMember_pw().equals(member_pw)) {
            session.setAttribute("member_id", member_id);
            MemberVO member = mapper.selectOne(member_id);
            session.setAttribute("member_grade", member.getMember_grade());
            if(member.getMember_grade().equals("C")) {
               return 2;
            }else {
               return 1;
            }
         }
      }
      return 0;
   }

   @Override
   public String logout(HttpSession Session) {
      Session.invalidate();
      return "home";
   }

   @Override
   public int UpdateMember(MemberVO member) {
      return mapper.updateMember(member);
   }

   @Override
   public MemberVO selectOne(String id) {
      MemberVO member = mapper.selectOne(id);
      return member;
   }

   @Override
   public String DeleteMem(HttpSession session, String id) {
      int result =mapper.deleteMember(id);
      session.invalidate();
      String path="";
      if(result==1) {
         path = "회원탈퇴 되었습니다!";
      }
      
      
      return path;
   }

   @Override
   public ArrayList<MemberVO> selectAll() {
      ArrayList<MemberVO>list = mapper.selectALL();

      return list;
   }

   @Override
   public ArrayList<MemberVO> selectid(String id) {
      ArrayList<MemberVO> list = mapper.selectOneID(id);
      return list;
   }

   @Override
   public ArrayList<MemberVO> seletname(String name) {
      ArrayList<MemberVO> list = mapper.selectOneName(name);
      return list;
   }

   @Override
   public ArrayList<MemberVO> selectgrade(String grade) {
      ArrayList<MemberVO> list = mapper.selectOneGrade(grade);
      return list;
   }

   @Override
   public String updateGrade(String id, String grade) {
      int result = mapper.updateGrade(id, grade) ;
      String path = "";
      if(result==1) {
         path = "등급 수정 완료되었습니다.";
      }
      return path;
   }

   @Override
   public String updateMemberManager(MemberVO member) {
      int result = mapper.updateMemberManager(member);
      String path = "";
      if(result==1) {
         path = "회원정보수정 완료되었습니다.";
      }
      return path;
   }

   @Override
   public String deleteMemberManager(String id) {
      int result = mapper.deleteMemberManager(id);
      String path = "";
      if(result==1) {
         path = "회원탈퇴 완료되었습니다.";
      }
      return path;
   }

   @Override
   public List<MemberVO> getMemManagerList(String status, String keyword, int startNum) {
	   
      if(status.equals("")) {
    	  return mapper.getMemManagerList(keyword, startNum);    	  
      } else if(status.equals("id")) {
    	  return mapper.getMemManagerListId(keyword, startNum);   
	  } else if(status.equals("name")) {
		  return mapper.getMemManagerListName(keyword, startNum);   
	  } else {
		  return mapper.getMemManagerListGrade(keyword, startNum);   
	  }
   }

	@Override
	public int getMemberMaxPage(String status, String keyword) {
		if(status.equals("")) {
			return mapper.getMemberMaxPage(keyword);
	    } else if(status.equals("id")) {
	    	return mapper.getMemberMaxPageId(keyword);
		} else if(status.equals("name")) {
			return mapper.getMemberMaxPageName(keyword);
		} else {
			return mapper.getMemberMaxPageGrade(keyword);
		}
	}
	
	@Override
   public List<MemberVO> getManagerManagerList(String status, String keyword, int startNum) {
	   
      if(status.equals("")) {
    	  return mapper.getManagerManagerList(keyword, startNum);    	  
      } else if(status.equals("id")) {
    	  return mapper.getManagerManagerListId(keyword, startNum);   
	  } else if(status.equals("name")) {
		  return mapper.getManagerManagerListName(keyword, startNum);   
	  } else {
		  return mapper.getManagerManagerListGrade(keyword, startNum);   
	  }
   }

	@Override
	public int getManagerMaxPage(String status, String keyword) {
		if(status.equals("")) {
			return mapper.getManagerMaxPage(keyword);
	    } else if(status.equals("id")) {
	    	return mapper.getManagerMaxPageId(keyword);
		} else if(status.equals("name")) {
			return mapper.getManagerMaxPageName(keyword);
		} else {
			return mapper.getManagerMaxPageGrade(keyword);
		}
	}

}