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
	public @ResponseBody HashMap<String, Object> clubNoticeListForm(@RequestParam HashMap<String, String> params) {
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
	public ModelAndView clubNoticeDetail(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("공지사항 상세보기");
		String member_id = (String)session.getAttribute("userId");
		return clubBbsService.clubNoticeDetail(params,member_id);
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
	public ModelAndView clubNoticeUpdate(@RequestParam HashMap<String, String> params,HttpSession session) throws Exception {
		logger.info("공지사항 게시글 수정");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubNoticeUpdate(params,clubBbs_id,root);
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
	
	
	/*************************************전체글보기***************************************/
	
	//전체글보기 리스트 페이지 
	@RequestMapping(value="/clubAllList")
	public String clubAllListForm() {
		logger.info("전체글보기 리스트 폼");
		return "c02";
	}
	
	//전체글보기 리스트 보기
	@RequestMapping(value = "/clubAllListForm")
	public @ResponseBody HashMap<String, Object> clubAllListForm(@RequestParam("club_id") String club_id) {
		logger.info("전체글보기 게시판 리스트");
		return clubBbsService.clubAllList(club_id);
	}
	
	//전체글보기 상세보기
	@RequestMapping(value = "/clubAllDetail")
	public ModelAndView clubAllDetail(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("전체글보기 게시판 상세보기");
		String member_id = (String)session.getAttribute("userId");
		String club_id = params.get("club_id");
		String clubBbs_id = params.get("clubBbs_id");
		logger.info(club_id+"/"+clubBbs_id);
		return clubBbsService.clubAllDetail(params,member_id);
	}
	
	//전체글보기 수정 폼
	@RequestMapping(value = "/clubAllUpdateForm")
	public ModelAndView clubAllUpdateForm(@RequestParam HashMap<String, String> params) {
		logger.info("전체글보기 게시판 수정 폼");
		return clubBbsService.clubAllUpdateForm(params);
	}
	
	//전체글보기 수정
	@RequestMapping(value = "/clubAllUpdate")
	public ModelAndView clubAllUpdate(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("전체글보기 게시판 수정");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubAllUpdate(params,clubBbs_id,root);
	}		
	
	//전체글보기 삭제
	@RequestMapping(value = "/clubAllDelete")
	public String clubAllDelete(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("전체글보기 게시판 삭제");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		clubBbsService.clubAllDelete(clubBbs_id,root);
		return "redirect:/clubAllList?club_id="+params.get("club_id");
	}
	
	
	/*************************************자유게시판***************************************/
	
	
	//자유게시판 리스트 폼
	@RequestMapping(value="/clubFreeBbsList")
	public String clubFreeBbsListForm() {
		logger.info("자유게시판 리스트 폼");
		return "c09";
	}
	
	//자유게시판 리스트 조회  
	@RequestMapping(value = "/clubFreeBbsListForm")
	public @ResponseBody HashMap<String, Object> clubFreeBbsListForm(@RequestParam("club_id") String club_id, @RequestParam("sort") String clubBbs_sort,HttpSession session) {
		logger.info("자유게시판 리스트");
		String member_id = (String)session.getAttribute("userId");
		return clubBbsService.clubFreeBbsList(club_id,clubBbs_sort,member_id);
	}
		
	//자유게시판 상세보기
	@RequestMapping(value = "/clubFreeBbsDetail")
	public ModelAndView clubFreeDetail(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("자유게시판 상세보기");
		String member_id = (String) session.getAttribute("userId");
		return clubBbsService.clubFreeDetail(params,member_id);
	}	
	
	//자유게시판 글쓰기 폼
	@RequestMapping(value="/clubFreeBbsWriteForm")
	public String clubFreeBbsWriteForm() {
		logger.info("자유게시판 글쓰기 폼");
		return "c10";
	}
	
	//자유게시판 글쓰기
	@RequestMapping(value="/clubFreeBbsWrite")
	public ModelAndView clubFreeWrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("자유게시판 글쓰기 호출");
		String member_id = (String) session.getAttribute("userId");
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubFreeWrite(params,member_id,root);
	}
	
	//자유게시판 수정 폼 
	@RequestMapping(value = "/clubFreeUpdateForm")
	public ModelAndView clubFreeUpdateForm(@RequestParam HashMap<String, String> params) {
		logger.info("자유게시판 게시판 수정 폼");
		return clubBbsService.clubFreeUpdateForm(params);
	}
	
	//자유게시판 수정
	@RequestMapping(value = "/clubFreeBbsUpdate")
	public ModelAndView clubFreeBbsUpdate(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("자유게시판 게시판 수정");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubFreeBbsUpdate(params,clubBbs_id,root);
	}		
	
	//자유게시판 삭제
	@RequestMapping(value = "/clubFreeBbsDelete")
	public String clubFreeBbsDelete(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("자유게시판 게시판 삭제");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		clubBbsService.clubFreeBbsDelete(clubBbs_id,root);
		return "redirect:/clubFreeBbsList?club_id="+params.get("club_id")+"&sort=free";
	}
	
	
	/****************************************사진첩***************************************/
	
	
	//사진첩 리스트 폼
	@RequestMapping(value="/clubPhotoBbsList")
	public String clubPhotoBbsList() {
		logger.info("사진첩 리스트 폼");
		return "c13";
	}
	
	//사진첩 리스트 조회 
	@RequestMapping(value = "/clubPhotoBbsListForm")
	public @ResponseBody HashMap<String, Object> clubPhotoBbsListForm(@RequestParam("club_id") int club_id, @RequestParam("sort") String clubBbs_sort,HttpSession session) {
		logger.info("자유게시판 리스트");
		String member_id = (String)session.getAttribute("userId");
		return clubBbsService.clubPhotoBbsListForm(club_id,clubBbs_sort,member_id);
	}
	
	//사진첩 상세보기
	@RequestMapping(value = "/clubPhotoBbsDetail")
	public ModelAndView clubPhotoBbsDetail(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("사진첩 상세보기");
		String member_id = (String)session.getAttribute("userId");
		return clubBbsService.clubPhotoBbsDetail(params,member_id);
	}
	
	//사진첩 글쓰기 폼
	@RequestMapping(value="/clubPhotoBbsWriteForm")
	public String clubPhotoBbsWriteForm() {
		logger.info("사진첩 글쓰기 폼");
		return "c14";
	}
	
	//사진첩 글쓰기
	@RequestMapping(value="/clubPhotoBbsWrite")
	public ModelAndView clubPhotoBbsWrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("사진첩 글쓰기 호출");
		String member_id = (String) session.getAttribute("userId");
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubPhotoBbsWrite(params,member_id,root);
	}
	
	//사진첩 수정 폼 
	@RequestMapping(value = "/clubPhotoBbsUpdateForm")
	public ModelAndView clubPhotoBbsUpdateForm(@RequestParam HashMap<String, String> params) {
		logger.info("자유게시판 게시판 수정 폼");
		return clubBbsService.clubPhotoBbsUpdateForm(params);
	}
	
	//사진첩 수정 
	@RequestMapping(value = "/clubPhotoBbsUpdate")
	public ModelAndView clubPhotoBbsUpdate(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("자유게시판 게시판 수정");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		return clubBbsService.clubPhotoBbsUpdate(params,clubBbs_id,root);
	}	
	
	//사진첩 삭제 
	@RequestMapping(value = "/clubPhotoBbsDelete")
	public String clubPhotoBbsDelete(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("자유게시판 게시판 삭제");
		int clubBbs_id = Integer.parseInt(params.get("clubBbs_id"));
		String root = session.getServletContext().getRealPath("/");
		clubBbsService.clubPhotoBbsDelete(clubBbs_id,root);
		return "redirect:/clubPhotoBbsList?club_id="+params.get("club_id")+"&sort=photo";
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
