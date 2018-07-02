package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hamo.dao.ClubMemberInter;

@Service
public class ClubMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubMemberInter inter;

	public void clubMemberList(Model model, String club_id) {
		inter = sqlSession.getMapper(ClubMemberInter.class);
		
		ArrayList<HashMap<String, Object>> result = 
				inter.clubMemberList(Integer.parseInt(club_id));
		
		model.addAttribute("list", result);
	}

}
