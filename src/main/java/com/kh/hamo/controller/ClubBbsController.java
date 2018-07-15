package com.kh.hamo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.ClubBbsService;
import com.kh.hamo.service.ClubFileService;

@Controller
public class ClubBbsController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ClubBbsService clubBbsService;
	@Autowired
	ClubFileService clubFileService;
	
	/*************************************공지사항***************************************/
	
	//회장 아이디 찾기 
	@RequestMapping(value="/findMater")
	public @ResponseBody HashMap<String, Object> findMater(@RequestParam HashMap<String, String> params) {
		logger.info("동호회 회장 닉네임 찾기");
		return clubBbsService.findMaster(params);
	}
	
	//공지사항 이동 폼
	@RequestMapping(value="/clubNoticeList")
	public String clubFreeBbsList() {
		logger.info("공지사항 리스트 폼");
		return "c05";
	}
		
	//공지사항 게시판 리스트 보기
	@RequestMapping(value = "/clubNoticeListForm", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> clubNoticeListForm(@RequestParam HashMap<String, String> params ,HttpSession session) {
		logger.info("공지사항 게시판 리스트 보기");

		int club_id = Integer.parseInt(params.get("club_id"));
		logger.info("동호회 아이디 : "+club_id);
		String sort = params.get("sort");
		
		return clubBbsService.clubNoticeList(club_id,sort);
	}
	
	//공지사항 글쓰기 폼
	@RequestMapping(value="/clubNoticeWriteForm")
	public String clubNoticeForm() {
		logger.info("공지사항 글쓰기 폼");
		return "c06";
	}
	
	//공지사항 상세보기
	@RequestMapping(value="/clubNoticeDetail")
	public ModelAndView clubNoticeDetail(@RequestParam HashMap<String, String> params) {
		logger.info("공지사항 상세보기");
		return clubBbsService.clubNoticeDetail(params);
	}
	
	//공지사항 글쓰기
	@RequestMapping(value="/clubNoticeWrite")
	public ModelAndView clubNoticeWrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("공지사항 글쓰기 호출");
		String member_id = (String) session.getAttribute("userId");
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubNoticeWrite(params,member_id,root);
	}
	
	//공지사항 게시글 수정 폼
	@RequestMapping(value="/clubNoticeUpdateForm")
	public ModelAndView clubNoticeUpdateForm(@RequestParam("clubBbs_id") String clubBbs_id,HttpSession session) throws Exception {
		logger.info("공지사항 게시글 수정폼");
		return clubBbsService.clubNoticeUpdateForm(clubBbs_id);
	}	
	
	//공지사항 게시글 수정
	@RequestMapping(value="/clubNoticeUpdate")
	public ModelAndView clubNoticeUpdate(@RequestParam HashMap<String, String> params) throws Exception {
		logger.info("공지사항 게시글 수정");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		return clubBbsService.clubNoticeUpdate(params,clubBbs_id);
	}
	
	//공지사항 게시글 삭제 
	@RequestMapping(value="/clubNoticeDelete")
	public String clubNoticeDelete(@RequestParam HashMap<String, String> params,HttpSession session) throws Exception {
		logger.info("공지사항 게시글 삭제");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		clubBbsService.clubNoticeDelete(clubBbs_id,root);
		
		return "redirect:/clubNoticeList?club_id="+params.get("club_id")+"&sort=notice";
	}
	
	
	/*************************************파일업로드***************************************/
	
	//파일업로드
	@RequestMapping(value="/file_uploader_html5.do")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		logger.info("파일 업로드 요청");
		clubBbsService.clubFileUpload(request,response);
	}
	
	/*************************************댓글***************************************/
	
	//댓글 리스트
	@RequestMapping(value="/clubReplyList")
	public @ResponseBody HashMap<String, Object>  clubNoticeReplyList(@RequestParam("clubBbs_id") String clubBbs_id) {
		logger.info("댓글 리스트");
		return clubBbsService.clubReplyList(clubBbs_id);
	}
	
	//댓글 작성
	@RequestMapping(value="/clubReply")
	public @ResponseBody HashMap<String, Object>  clubReply(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("댓글 작성");
		String member_id = (String)session.getAttribute("userId");
		return clubBbsService.clubReply(params,member_id);
	}
	
	//댓글 삭제
	@RequestMapping(value="/clubReplyDelete")
	public @ResponseBody HashMap<String, Object>  clubNoticeReplyDelete(@RequestParam("clubBbs_id") String clubBbs_id,@RequestParam("clubBbsReply_id") String clubBbsReply_id) {
		logger.info("댓글 삭제");
		return clubBbsService.clubReplyDelete(clubBbs_id,clubBbsReply_id);
	}
	
}
