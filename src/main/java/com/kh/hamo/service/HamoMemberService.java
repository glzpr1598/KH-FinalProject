package com.kh.hamo.service;

import java.util.HashMap;

import javax.servlet.ServletException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.kh.hamo.dao.HamoMemberInter;
import com.kh.hamo.dto.HamoMemberDTO;

@Service
public class HamoMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
	HamoMemberInter inter = null;

	
	
	public HashMap<String, Integer> idOverlay(String id, int idLength) {
		inter = sqlSession.getMapper(HamoMemberInter.class);
		logger.info("아이디중복검사(서비스)");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.idOverlay(id);
		map.put("idLength",idLength);
		map.put("success", success);
		return map;
	}



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
		
		try {
			if(select1 != "소분류") {
				selectNumber1 = inter.memberSelect(select1);
				success1 = inter.memberInterest(id,selectNumber1);
			}	
		}catch(Exception e){
			selectNumber1 = 0;
		}
		
		try {
			if(select2 != "소분류") {
				selectNumber2 = inter.memberSelect(select2);
				success2 = inter.memberInterest(id,selectNumber2);
			}
		}catch(Exception e){
			selectNumber2 = 0;
		}
		
		try {
			if(select3 != "소분류") {
				selectNumber3 = inter.memberSelect(select3);
				success3 = inter.memberInterest(id,selectNumber3);
			}
		}catch(Exception e){
			selectNumber3 = 0;
		}

		if( ( success1 == 1 || success2 == 1 || success3 == 1 ) && success == 1  ) {
			lastSuccess = 1;
		}
		
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		map.put("success", lastSuccess);
		
		
		
		return map;
	}
}
