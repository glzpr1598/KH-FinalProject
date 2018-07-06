package com.kh.hamo.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.hamo.dao.ClubAdminInter;

@Service
public class ClubAdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubAdminInter inter;

    // 동호회 폐쇄 등록
	public void clubClose(String club_id) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		// 폐쇄 테이블에 추가
		inter.clubClose(club_id);
	}
	
	// 동호회 폐쇄 날짜 확인 후 동호회 삭제
	@Scheduled(cron = "0 0 0 * * *")  // 매일 0시마다
	public void clubCloseCheck() {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		// 폐쇄 날짜 가져오기
		ArrayList<HashMap<String, Object>> list = inter.clubCloseDate();
		// 오늘 날짜
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		for(HashMap<String, Object> item: list) {
			// 폐쇄 날짜와 오늘 날짜가 일치하면
			if(item.get("CLUBCLOSE_DATE").equals(today)) {
				// 동호회 삭제
				inter.clubDelete(item.get("CLUB_ID"));
				// 동호회 폐쇄 삭제
				inter.clubCloseDelete(item.get("CLUBCLOSE_ID"));
			}
		}
	}

}
