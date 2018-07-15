package com.kh.hamo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.ClubAdminService;

@Controller
public class ClubAdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubAdminService service;
	
	// 동호회 폐쇄 페이지 이동
	@RequestMapping(value = "/clubCloseForm")
	public String clubCloseForm() {
		logger.info("폐쇄하기 페이지 요청");
		return "c26";
	}
	// 동호회 폐쇄 등록
	@RequestMapping(value = "/clubClose")
	public String clubClose(@RequestParam String club_id) {
		logger.info("동호회 폐쇄 등록 요청");
		
		// 폐쇄 테이블에 추가
		service.clubClose(club_id);
		
		return "close-reload";
	}
	
	// 동호회 폐쇄 검사
	@RequestMapping(value = "/clubCloseCheck")
	public @ResponseBody HashMap<String, Object> clubCloseCheck(
			@RequestParam String club_id) {
		logger.info("동호회 폐쇄 검사 요청");
		
		// 동호회 폐쇄 검사
		return service.clubCloseCheck(club_id);
	}
	
	// 동호회 폐쇄 알림창
	@RequestMapping(value = "/clubCloseAlert")
	public String clubCloseAlert() {
		logger.info("동호회 폐쇄 알림창 요청");
		return "c28";
	}
	
	// 동호회 폐쇄 취소 페이지
	@RequestMapping(value = "/clubCloseCancelForm")
	public String clubCloseCancelForm() {
		logger.info("동호회 폐쇄 취소창 요청");
		return "c27";
	}
	// 동호회 폐쇄 취소
	@RequestMapping(value = "/clubCloseCancel")
	public String clubCloseCancel(@RequestParam String club_id) {
		logger.info("동호회 폐쇄 취소 요청");
		
		// 동호회 폐쇄 DB 삭제
		service.clubCloseCancel(club_id);
		
		return "close-reload";
	}
	
	// 동호회 사진 업로드 창
	@RequestMapping(value = "/clubPictureUploadForm")
	public String clubPictureUploadForm() {
		logger.info("동호회 사진 업로드 창 요청");
		return "c21";
	}
	
	// 동호회 사진 업로드
	@Transactional
	@RequestMapping(value = "/clubPictureUpload")
	public String clubPictureUpload(MultipartFile file, HttpSession session,
			@RequestParam String club_id) {
		logger.info("동호회 사진 업로드 요청");
		
		// 실제로 이미지가 저장되는 디렉토리 경로
		// C:\...\wtpwebapps\KH-FinalProject\
		String dirPath = session.getServletContext().getRealPath("/");
		dirPath += "resources/club-picture/";
		logger.info("dirPath : " + dirPath);
		
		// 동호회 사진 삭제 서비스
		service.clubPictureDelete(dirPath, club_id);
		
		// 사진 업로드 서비스
		service.clubPictureUpload(file, dirPath, club_id);
		
		return "close-reload";
	}
	
	// 동호회 사진 삭제
	@RequestMapping(value = "/clubPictureDelete")
	public String clubPictureDelete(HttpSession session, @RequestParam String club_id) {
		logger.info("동호회 사진 삭제 요청");
		
		// 실제로 이미지가 저장되는 디렉토리 경로
		// C:\...\wtpwebapps\KH-FinalProject\
		String dirPath = session.getServletContext().getRealPath("/");
		dirPath += "resources/club-picture/";
		logger.info("dirPath : " + dirPath);
		
		// 동호회 사진 삭제 서비스
		service.clubPictureDelete(dirPath, club_id);
		
		return "redirect:/clubMain?club_id="+club_id;
	}
	
	// 동호회 소개글 수정 창
	@RequestMapping(value = "/clubIntroduceUpdateForm")
	public String clubIntroduceUpdateForm() {
		logger.info("동호회 소개글 수정 창 요청");
		return "c22";
	}
	
	// 동호회 소개글 수정
	@RequestMapping(value = "/clubIntroduceUpdate")
	public String clubIntroduceUpdate(@RequestParam String club_id, String introduce) {
		logger.info("동호회 소개글 수정 요청");
		
		// 소개글 수정 서비스
		service.clubIntroduceUpdate(club_id, introduce);
		
		return "close-reload";
	}
	
}
