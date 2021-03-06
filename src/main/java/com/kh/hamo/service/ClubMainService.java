package com.kh.hamo.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.hamo.dao.ClubMainInter;

@Service
public class ClubMainService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubMainInter inter;

    // 동호회 정보
	public HashMap<String, Object> clubInfo(String club_id) {
		inter = sqlSession.getMapper(ClubMainInter.class);
		
		return inter.clubInfo(Integer.parseInt(club_id));
	}

	
	// 동호회 사진, 소개글 조회
	public void clubMain(Model model, String club_id) {
		inter = sqlSession.getMapper(ClubMainInter.class);
		
		// 사진 이름 가져오기
		String picture = inter.clubPicture(club_id);
		
		// 동호회 소개글 가져오기
		String introduce = inter.clubIntroduce(club_id);
		
		// 모델에 담기
		model.addAttribute("picture", picture);
		model.addAttribute("introduce", introduce);
		
	}


	public String nickNameSearch(String userId, String clubId) {
		inter = sqlSession.getMapper(ClubMainInter.class);
		

		return  inter.nickNameSearch(userId,Integer.parseInt(clubId)); 
	}
    
    

}
