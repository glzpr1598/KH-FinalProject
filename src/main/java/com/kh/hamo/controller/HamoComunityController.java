package com.kh.hamo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tools.ant.taskdefs.Touch.DateFormatFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.service.HamoBbsService;

@Controller
public class HamoComunityController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	HamoBbsService hamoBbsService;
	

	
	@RequestMapping(value = "/freeBbsListPage") // o 
	public String freeBbsListPage() {
		logger.info("자유게시판 리스트 페이지 요청");
		return "m12";
	}	

	@RequestMapping(value = "/freeBbsList") // o 
	public @ResponseBody HashMap<String, Object>
	freeBbsList() {
		logger.info("자유게시판 리스트 요청");
		return hamoBbsService.freeBbsList();
	}	

	@RequestMapping(value = "/freeBbsdetail") 
	public String freeBbsdetail(@RequestParam HashMap<String, String> map,Model model) {
		logger.info("자유게시판 글 상세보기 요청");
		logger.info("글 번호 :::::::::::"+map.get("idx"));
		/*freeBbsdetail 컨트롤러로 오는 경우는
		 1)리스트에서 해당 글을 상세보기 할 경우
		 2)글쓰기 완료 후 상세보기 페이지로 이동 한 경우
		 3)수정 완료 후 상세보기 할 경우
		 이때 , 수정 완료 후 상세보기 할 경우에 조회수 올라가는 것을 방지 하기 위해 updateAfter 파라메터를 기준으로 분기
		 즉 , updateAfter 가 0 로 올 경우에는 글쓰기 또는 수정하고 온 경우로 가정 하며 이때는 조회수 올려주지 않기로 함.  */
		int flag = 1 ;
		if(map.get("updateAfter").equals("0")) {
			flag=0; //flag 가 0 인 경우 조회수는 올리지 않기로 한다.
		}
		hamoBbsService.hamoBbsdetail(map.get("idx"),flag,model);
		return "m14";
	}
	
	@RequestMapping(value = "/freeBbsUpdateForm") // o 
	public String freeBbsUpdateForm(@RequestParam("idx") String idx,Model model) {
		logger.info("자유게시판 글 수정 창 요청");
		logger.info("글아이디: "+idx);
		int flag = 0;
		hamoBbsService.hamoBbsdetail(idx,flag,model);
		return "m15";
	}
	
	@RequestMapping(value = "/freeBbsUpdate") // o 
	public ModelAndView freeBbsUpdate(@RequestParam HashMap<String, String> map,HttpSession session) {	
		logger.info("글 수정 요청");
		logger.info("글 번호: "+map.get("idx"));
		logger.info("컨트롤러에서 수정 할 내용: "+map.get("content"));
		String root = session.getServletContext().getRealPath("/");
		//updateAfter=0을 같이 보내는 이유는 글 수정시에는 조회수 올라가는 것을 방지하기 위해
		return hamoBbsService.freeBbsUpdate(map,root);
	}
	
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/freeBbsWrite") // o 
	public ModelAndView freeBbsWrite(@RequestParam HashMap<String, String> map,HttpSession session) {
		logger.info("글쓰기 요청");
		//글쓰기 요청 한 회원 id 를 map에 담아줌 . why ? 어떤 회원이 글쓰기를 하였는지 확인하기위해
		map.put("userId", (String)session.getAttribute("userId"));
		String root = session.getServletContext().getRealPath("/");
		return hamoBbsService.freeBbsWrite(map,root);
	}
	
	@RequestMapping(value = "/freeBbsWriteForm") // o 
	public String freeBbsWriteForm() {
		logger.info("자유게시판 글쓰기 폼  요청");
		return "m13";
	}
	
	// 글 삭제 후 게시글 리스트로 이동 ----글 삭제 실패시 상세보기 폼으로 이동하는 것 개발!!!!!!!
	@RequestMapping(value = "/freeBbsDelete") // o 
	public String freeBbsDelete(@RequestParam("idx") String idx,HttpSession session) {
		logger.info("자유게시판 글  삭제 요청");
		String root = session.getServletContext().getRealPath("/");
		logger.info("root 경로 : "+root);
		hamoBbsService.hamoBbsDelete(idx,root);
		return "redirect:/freeBbsListPage";
	}
	
	/**************************댓글*************************/
	// 특정 글의 댓글 리스트 조회
	@RequestMapping(value = "/hamoBbsReplyList") // x 
	public @ResponseBody HashMap<String, Object>
	hamoBbsReplyList(@RequestParam HashMap<String, String> params) {		
		logger.info("게시판 댓글 리스트");	
		logger.info("글 번호: "+params.get("mainBbs_id"));
		int mainBbs_id =Integer.parseInt(params.get("mainBbs_id"));
		return hamoBbsService.hamoBbsReplyList(mainBbs_id);
	}
	
	// 게시판 댓글 등록
	@RequestMapping(value = "/hamoBbsReply") // x
	public @ResponseBody HashMap<String, Object>
	hamoBbsReply(@RequestParam HashMap<String, String> params) {		
		logger.info("게시판 댓글 등록 요청");	
		logger.info("글 번호: "+params.get("mainBbs_id"));
		logger.info("댓글등록 하는 회원 id: "+params.get("member_id"));
		logger.info("댓글 내용: "+params.get("mainBbsReply_content"));
		return hamoBbsService.hamoBbsReply(params);
	}
	
	// 게시판 댓글 삭제
	@RequestMapping(value = "/hamoBbsReplyDel") //x
	public @ResponseBody HashMap<String, Object> hamoBbsReplyDel(@RequestParam HashMap<String, String> params) {		
		logger.info("게시판 댓글 삭제 요청");	
		logger.info("댓글 삭제 하는 게시글 아이디(댓글 수 조절 위해) : "+params.get("mainBbs_id"));
		logger.info("댓글 삭제를 요청 하는 아이디 :"+params.get("member_id"));
		logger.info("댓글 아이디 : "+params.get("reply_id"));

		return hamoBbsService.hamoBbsReplyDel(params);
	}

	/********************다중파일업로드******************/
	@RequestMapping(value="/file_uploader_html.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		logger.info("파일 업로드 요청");
		hamoBbsService.hamoBbsUpload(request,response);
	}
	
	
	
	
	
	/********************동호회 친목**********************/
	
	@RequestMapping(value = "/friendShipBbsListPage")
	public String friendShipBbsListPage() {
		logger.info("동호회 친목 리스트 페이지 요청");
		return "m16";
	}	

	@RequestMapping(value = "/friendShipBbsList") 
	public @ResponseBody HashMap<String, Object>friendShipBbsList() {
		logger.info("동호회 게시판 리스트 요청");
		return hamoBbsService.friendShipBbsList(); //서비스 다시
	}
	
	@RequestMapping(value = "/friendShipBbsdetail") // o 
	public String friendShipBbsdetail(@RequestParam HashMap<String, String> map,Model model) {
		logger.info("동호회 친목 게시판 글 상세보기 요청");
		logger.info("글 번호 :::::::::::"+map.get("idx"));

		int flag = 1 ;
		if(map.get("updateAfter").equals("0")) {
			flag=0; //flag 가 0 인 경우 조회수는 올리지 않기로 한다.
		}
		hamoBbsService.hamoBbsdetail(map.get("idx"),flag,model);
		return "m18";
	}
	
	@RequestMapping(value = "/friendShipUpdateForm") // o 
	public String friendShipUpdateForm(@RequestParam("idx") String idx,Model model) {
		logger.info("동호회 친목 게시판 글 수정 창 요청");
		logger.info("글아이디: "+idx);
		int flag = 0;
		hamoBbsService.hamoBbsdetail(idx,flag,model);
		return "m19";
	}
	
	@RequestMapping(value = "/friendShipBbsUpdate") // 서비스 만들어줘야함
	public ModelAndView friendShipBbsUpdate(@RequestParam HashMap<String, String> map,HttpSession session) {	
		logger.info("글 수정 요청");
		logger.info("글 번호: "+map.get("idx"));
		logger.info("컨트롤러에서 수정 할 내용: "+map.get("content"));
		String root = session.getServletContext().getRealPath("/");
		//updateAfter=0을 같이 보내는 이유는 글 수정시에는 조회수 올라가는 것을 방지하기 위해
		return hamoBbsService.friendShipBbsUpdate(map,root);
	}
	
	@RequestMapping(value = "/friendShipBbsWriteForm") 
	public String friendShipBbsWriteForm() {
		logger.info("동호회 친목 게시판 글쓰기 폼  요청");
		return "m17";
	}
	
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/friendShipBbsWrite") // 서비스만들어줘야함 
	public ModelAndView friendShipBbsWrite(@RequestParam HashMap<String, String> map,HttpSession session) {
		logger.info("글쓰기 요청");
		//글쓰기 요청 한 회원 id 를 map에 담아줌 . why ? 어떤 회원이 글쓰기를 하였는지 확인하기위해
		map.put("userId", (String)session.getAttribute("userId"));
		String root = session.getServletContext().getRealPath("/");
		return hamoBbsService.friendShipBbsWrite(map,root);
	}


	
	// 글 삭제 후 게시글 리스트로 이동 ----글 삭제 실패시 상세보기 폼으로 이동하는 것 개발!!!!!!!
	@RequestMapping(value = "/friendShipBbsDelete") // o 
	public String friendShipBbsDelete(@RequestParam("idx") String idx,HttpSession session) {
		logger.info("동호회 친목 게시판 글  삭제 요청");
		String root = session.getServletContext().getRealPath("/");
		logger.info("root 경로 : "+root);
		hamoBbsService.hamoBbsDelete(idx,root);
		return "redirect:/friendShipBbsListPage";
	}
	
}

