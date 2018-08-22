package com.kh.hamo.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;

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
	@Scheduled(cron = "0/3 * * * * * ")  // 10초마다
	public void clubCloseSchedule() {
		logger.info("동호회 폐쇄 검사");
		
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

	// 동호회 폐쇄 검사
	public HashMap<String, Object> clubCloseCheck(String club_id) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		String clubClose_date = inter.clubCloseCheck(club_id);
		result.put("clubClose_date", clubClose_date);
		
		return result;
	}

	// 동호회 폐쇄 취소
	public void clubCloseCancel(String club_id) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		inter.clubCloseCancel(club_id);
	}
	
	// 동호회 사진 삭제
	public void clubPictureDelete(String dirPath, String club_id) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		// DB에서 해당 동호회의 newName list 가져오기
		ArrayList<String> newNameList = inter.clubPictureName(club_id);
		
		for(String newName: newNameList) {
			// 실제 파일
			File file = new File(dirPath + newName);
			// 파일이 존재하면 삭제
			if(file.exists()) {
				file.delete();
			}
		}
		
		// DB에서 동호회 사진 삭제
		inter.clubPictureDelete(club_id);
	}

	// 동호회 사진 업로드
	public void clubPictureUpload(MultipartFile file, String dirPath, String club_id) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		// 디렉토리  생성
		File dir = new File(dirPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// 원본 파일명 가져오기
		String oldName = file.getOriginalFilename();
		
		// 새로운 파일명(현재시간+원본확장자)
		String newName = System.currentTimeMillis() + 
				oldName.substring(oldName.lastIndexOf('.'));
		
		try {
			// 파일 생성
			byte[] bytes = file.getBytes();  // 파일 bytes
			Path filePath = Paths.get(dirPath + newName);  // 실제 파일 경로
			Files.write(filePath, bytes);  // 파일 생성
			
			// DB에 파일이름 저장
			inter.clubPictureUpload(oldName, newName, club_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 동호회 소개글 수정
	public void clubIntroduceUpdate(String club_id, String introduce) {
		inter = sqlSession.getMapper(ClubAdminInter.class);
		
		// 동호회 소개글 수정
		inter.clubIntroduceUpdate(club_id, introduce);
		
	}

}
