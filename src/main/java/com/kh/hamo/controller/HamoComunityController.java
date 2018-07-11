package com.kh.hamo.controller;

import java.sql.Date;
import java.util.HashMap;

import org.apache.tools.ant.taskdefs.Touch.DateFormatFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hamo.service.HamoFileService;
import com.kh.hamo.service.HamoFreeBbsService;
import com.kh.hamo.service.HamoFriendShipBbsService;

@Controller
public class HamoComunityController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	HamoFreeBbsService hamoFreeBbsService;
	@Autowired
	HamoFriendShipBbsService hamoFriendShipBbsService;
	@Autowired
	HamoFileService hamoFileService;
	
	@RequestMapping(value = "/freeBbsList")
	public String freeBbsList(Model model) {
		logger.info("자유게시판 리스트 요청");
		hamoFreeBbsService.freeBbsList(model);
		return "m12";
	}	
	@RequestMapping(value = "/freeBbsWriteForm")
	public String freeBbsWriteForm() {
		logger.info("글쓰기 폼  요청");
		return "m13";
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
		 즉 , updateAfter 가 1 로 올 경우에는 글쓰기 또는 수정하고 온 경우로 가정 하며 이때는 조회수 올려주지 않기로 함.  */
		int flag = 0 ;
		if(map.get("updateAfter").equals("1")) {
			logger.info("updateAfter:::::"+map.get("updateAfter"));
			flag=1; //flag 가 1 인 경우 조회수는 올리지 않기로 한다.
		}
		hamoFreeBbsService.freeBbsdetail(map.get("idx"),flag,model);
		return "m14";
	}
	@RequestMapping(value = "/freeBbsUpdateForm")
	public String freeBbsUpdateForm(@RequestParam("idx") String idx,Model model) {
		logger.info("글아이디: "+idx);
		logger.info("자유게시판 글 수정 창 요청");
		int flag = 1;
		hamoFreeBbsService.freeBbsdetail(idx,flag,model);
		return "m15";
	}
	@RequestMapping(value = "/freeBbsUpdate")
	public String freeBbsUpdate(@RequestParam HashMap<String, String> map,Model model) {	
		logger.info("글 번호: "+map.get("idx"));
		logger.info("컨트롤러에서 수정 할 내용: "+map.get("content"));
		hamoFreeBbsService.freeBbsUpdate(map);
		String idx =map.get("idx");
		//updateAfter=1을 같이 보내는 이유는 글 수정시에는 조회수 올라가는 것을 방지하기 위해
		return "redirect:/freeBbsdetail?idx="+idx+"&updateAfter=1"; 
	}
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/freeBbsWrite")
	public String freeBbsWrite(@RequestParam HashMap<String, String>map,Model model) {
		logger.info("글쓰기 요청");
		int mainBbs_id = hamoFreeBbsService.freeBbsWrite(map);
		return "redirect:/freeBbsdetail?idx="+mainBbs_id+"&updateAfter=1";
	}
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/freeBbsDelete")
	public String freeBbsDelete(@RequestParam("idx") String idx) {
		logger.info("글 삭제 요청");
		hamoFreeBbsService.freeBbsWrite(idx);
		return "redirect:/freeBbsList";
	}
	// 특정 글의 댓글 리스트 조회
	@RequestMapping(value = "/freeBbsReplyList")
	public @ResponseBody HashMap<String, Object>
	freeBbsReplyList(@RequestParam HashMap<String, String> params) {		
		logger.info("자유게시판 댓글 리스트");	
		logger.info("글 번호: "+params.get("mainBbs_id"));
		int mainBbs_id =Integer.parseInt(params.get("mainBbs_id"));
		return hamoFreeBbsService.freeBbsReplyList(mainBbs_id);
	}
	// 자유게시판 댓글 등록
	@RequestMapping(value = "/freeBbsReply")
	public @ResponseBody HashMap<String, Object>
	freeBbsReply(@RequestParam HashMap<String, String> params) {		
		logger.info("자유게시판 댓글 등록 요청");	
		logger.info("글 번호: "+params.get("mainBbs_id"));
		logger.info("댓글등록 하는 회원 id: "+params.get("member_id"));
		logger.info("댓글 내용: "+params.get("mainBbsReply_content"));
		return hamoFreeBbsService.freeBbsReply(params);
	}
	// 자유게시판 댓글 삭제
	@RequestMapping(value = "/freBbsReplyDel")
	public @ResponseBody HashMap<String, Object> freBbsReplyDel(@RequestParam HashMap<String, String> params) {		
		logger.info("자유게시판 댓글 삭제 요청");	
		logger.info("댓글 삭제 할 아이디 : "+params.get("reply_id"));
		logger.info("댓글 삭제 하는 게시글 아이디 : "+params.get("mainBbs_id"));
		return hamoFreeBbsService.freBbsReplyDel(params);
	}
}
