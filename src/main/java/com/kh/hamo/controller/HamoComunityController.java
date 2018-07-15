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
		 즉 , updateAfter 가 0 로 올 경우에는 글쓰기 또는 수정하고 온 경우로 가정 하며 이때는 조회수 올려주지 않기로 함.  */
		int flag = 1 ;
		if(map.get("updateAfter").equals("0")) {
			flag=0; //flag 가 0 인 경우 조회수는 올리지 않기로 한다.
		}
		hamoFreeBbsService.freeBbsdetail(map.get("idx"),flag,model);
		return "m14";
	}
	@RequestMapping(value = "/freeBbsUpdateForm")
	public String freeBbsUpdateForm(@RequestParam("idx") String idx,Model model) {
		logger.info("글아이디: "+idx);
		logger.info("자유게시판 글 수정 창 요청");
		int flag = 0;
		hamoFreeBbsService.freeBbsdetail(idx,flag,model);
		return "m15";
	}
	@RequestMapping(value = "/freeBbsUpdate")
	public String freeBbsUpdate(@RequestParam HashMap<String, String> map,Model model) {	
		logger.info("글 번호: "+map.get("idx"));
		logger.info("컨트롤러에서 수정 할 내용: "+map.get("content"));
		hamoFreeBbsService.freeBbsUpdate(map);
		String idx =map.get("idx");
		//updateAfter=0을 같이 보내는 이유는 글 수정시에는 조회수 올라가는 것을 방지하기 위해
		return "redirect:/freeBbsdetail?idx="+idx+"&updateAfter=0"; 
	}
	// 글쓰기 버튼 누를 시 서버에 글쓰기 내용 전달하는 컨트롤러
	@RequestMapping(value = "/freeBbsWrite")
	public String freeBbsWrite(@RequestParam HashMap<String, String>map,HttpSession session) {
		logger.info("글쓰기 요청");
		int mainBbs_id =0;
		//기본적으로 글쓰기 성공 후 해당 게시글 상세보기 요청
		String result = "redirect:/freeBbsdetail?idx="+mainBbs_id+"&updateAfter=0";
		
		//글쓰기 하는 회원의 id 를 map에 저장(글쓰기 창에서 세션 만료시 에러발생 방지 위해)
		if(session.getAttribute("userId") !=null) {
			map.put("userId", (String) session.getAttribute("userId"));
			mainBbs_id = hamoFreeBbsService.freeBbsWrite(map);
		}else {
			//글쓰기 창에서 세션 만료되었는데 글쓰기 요청을 할 경우 에러발생 방지위해 return 값을 게시글 리스트로
			logger.info("접속시간이 만료되어 글쓰기 요청이 불가합니다");
			result ="redirect:/freeBbsList"; 
		}
		return result;
	}
	// 글 삭제 후 게시글 리스트로 이동
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
		logger.info("댓글 삭제 하는 게시글 아이디(댓글 수 조절 위해) : "+params.get("mainBbs_id"));
		logger.info("댓글 삭제를 요청 하는 아이디 :"+params.get("member_id"));
		logger.info("댓글 아이디 : "+params.get("reply_id"));

		return hamoFreeBbsService.freBbsReplyDel(params);
	}
	
	
	
	
	//다중파일업로드
	@RequestMapping(value="/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         logger.info("파일 기본 경로 : "+dftFilePath);
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "controller/resource" + File.separator + "photo_upload" + File.separator;
	         logger.info("상세 경로 : "+filePath);
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;
	         sFileInfo += "&sFileURL="+"/controller/resource/photo_upload/"+realFileNm;
	         logger.info("sFileInfo: :  "+sFileInfo);
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	  
	    
	}
	
	
	
	
	
	
	
	
	
	
}

