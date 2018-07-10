package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.kh.hamo.dao.HamoMemberInter;
import com.kh.hamo.dto.HamoMemberDTO;

@Service
public class HamoMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
	HamoMemberInter inter = null;

	
	/**아이디 중복검사*/
	public HashMap<String, Integer> idOverlay(String id, int idLength) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		logger.info("아이디중복검사(서비스)");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.idOverlay(id);
		map.put("idLength",idLength);
		map.put("success", success);
		return map;
	}

	/**이메일 중복검사*/
	public HashMap<String, Integer> emailOverlay(String email) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		logger.info("이메일중복검사(서비스)");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.emailOverlay(email);
		map.put("success", success);
		return map;
	}
	
	/**회원가입*/
	public HashMap<String, Integer> 
		join(HamoMemberDTO memberdto, String select1, String select2, String select3, String id) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		logger.info("회원가입요청(서비스)");
		int success = inter.memberJoin(memberdto);
		
		int selectNumber1 = 0;
		int selectNumber2 = 0;
		int selectNumber3 = 0;
		
		int success1 = 0;
		int success2 = 0;
		int success3 = 0;
		
		int lastSuccess = 0;
		
		System.out.println(select1);
		System.out.println(select2);
		System.out.println(select3);
		
		if(!select1.equals("소분류")) {
			selectNumber1 = inter.memberSelect(select1);
			success1 = inter.memberInterest(id,selectNumber1);
		}
		if(!select2.equals("소분류")) {
			selectNumber2 = inter.memberSelect(select2);
			success2 = inter.memberInterest(id,selectNumber2);
		}
		if(!select3.equals("소분류")) {
			selectNumber3 = inter.memberSelect(select3);
			success3 = inter.memberInterest(id,selectNumber3);
		}

		if( ( success1 == 1 || success2 == 1 || success3 == 1 ) && success == 1  ) {
			lastSuccess = 1;
		}
		
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		map.put("success", lastSuccess);
		
		return map;
	}

	/**암호화된 비밀번호 받아오기 - 김응주*/
	public String pwlogin(String userId) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		String pw = inter.pwChk(userId); // 암호화된 pw를 받아온다.
		
		return pw;
	}

	/**아이디 찾기 - 김응주*/
	public String idSearch(String userName, String email) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		String id = inter.idSearch(userName, email); 
		return id;
	}

	/**비밀번호 찾기 - 김응주*/
	public String pwSearch(String userId, String email) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		String success = inter.pwSearch(userId, email);
		return success;
	}
	
	/**비밀번호 수정 - 김응주*/
	public boolean pwUpdate(String id, String pw) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		boolean success = inter.pwUpdate(id,pw);
		return success;
	}
	
	/**수정폼 - 김응주*/
	public ModelAndView updateForm(String userId) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		ModelAndView mav = new ModelAndView();
		if(userId != null) {
		mav.addObject("bbs", inter.updateForm(userId));
		ArrayList<Integer> list = inter.updateFormInterest(userId);

		
			int interest1 = 0;
			int interest2 = 0;
			int interest3 = 0;
			String inter1 = "소분류";
			String inter2 = "소분류";
			String inter3 = "소분류";
			
			
			if(list.size()==1) {
				interest1 = list.get(0);
				
				inter1 = inter.interest(interest1);
			}else if(list.size()==2) {
				interest1 = list.get(0);
				interest2 = list.get(1);
				
				inter1 = inter.interest(interest1);
				inter2 = inter.interest(interest2);
			}else {
				interest1 = list.get(0);
				interest2 = list.get(1);
				interest3 = list.get(2);
				inter1 = inter.interest(interest1);
				inter2 = inter.interest(interest2);
				inter3 = inter.interest(interest3);
				
			}
			mav.addObject("inter1", inter1);
			mav.addObject("inter2", inter2);
			mav.addObject("inter3", inter3);
			mav.setViewName("m05");	
			
		}else {
			mav.setViewName("m01");	
		}
		return mav;
	}

	/**회원정보 수정*/
	public HashMap<String, Integer> 
		userUpdate(HamoMemberDTO memberdto, String select1, String select2, String select3, String id) {
		inter = sqlSession.getMapper(HamoMemberInter.class);		

		// 1. 기존에 저장된 memberinterest 테이블의 유니크 memberinterest_id를 미리 저장해놓는다. 
		ArrayList<Integer> list = inter.updateInterest(id);
		int interest1 = 0;
		int interest2 = 0;
		int interest3 = 0;

		if(list.size()==1) {
			interest1 = list.get(0);
		}else if(list.size()==2) {
			interest1 = list.get(0);
			interest2 = list.get(1);
		}else {
			interest1 = list.get(0);
			interest2 = list.get(1);
			interest3 = list.get(2);
		}
		// 2. 관심사를 제외한 회원정보를 업데이트 한다.
		int success = inter.userUpdate(memberdto);
		
		// 3. 새로운 관심사를 추가한다.
		int selectNumber1 = 0;
		int selectNumber2 = 0;
		int selectNumber3 = 0;
		
		int success1 = 0;
		int success2 = 0;
		int success3 = 0;
		
		int lastSuccess = 0;

		if(!select1.equals("소분류")) {	// "소분류"로 들어온 값은 유저가 설정을 하지 않은 값이기 때문에 쿼리문을 돌리지않는다.
			selectNumber1 = inter.memberSelect(select1);
			success1 = inter.memberInterest(id,selectNumber1);
		}
		if(!select2.equals("소분류")) {
			selectNumber2 = inter.memberSelect(select2);
			success2 = inter.memberInterest(id,selectNumber2);
		}
		if(!select3.equals("소분류")) {
			selectNumber3 = inter.memberSelect(select3);
			success3 = inter.memberInterest(id,selectNumber3);
		}
		// 4. 기존에 있던 관심사를 제거한다.
		if(interest1 != 0) {inter.interestDel(interest1);}
		if(interest2 != 0) {inter.interestDel(interest2);}
		if(interest3 != 0) {inter.interestDel(interest3);}
		
		// 5. 최종확인
		if( ( success1 == 1 || success2 == 1 || success3 == 1 ) && success == 1  ) {
			lastSuccess = 1;
		}
		
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		map.put("success", lastSuccess);
		
		return map;
	}

	public int emailUpdate(String id, String email) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		int success = inter.emailUpdate(id, email);
		return success;
	}




	





}
