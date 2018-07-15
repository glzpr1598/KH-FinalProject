package com.kh.hamo.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.ClubBbsInter;
import com.kh.hamo.dto.ClubBbsDTO;

@Service
public class ClubBbsService {
	
	// 업로드 한 파일명을 저장 후 나중에 DB 에 추가
	//newFileName,oldFileName
	HashMap<String,String> fileList = new HashMap<String,String>();	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubBbsInter clubBbsInter = null;
    
    /*************************************공지사항***************************************/
    
	//회장 아이디 찾기
	public HashMap<String, Object> findMaster(HashMap<String, String> params) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		String nick = clubBbsInter.findMaster(params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nick", nick);
		return map;
	}
    
	//공지사항 리스트
	public HashMap<String, Object> clubNoticeList(int club_id,String sort) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		logger.info("리스트 불러오기");
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubNoticeList(club_id, sort);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	//공지사항 상세보기
	@Transactional
	public ModelAndView clubNoticeDetail(HashMap<String, String> params) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		
		String clubBbs_id = params.get("clubBbs_id");
		
		//조회수 올리기
		clubBbsInter.clubBbsHit(clubBbs_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", clubBbsInter.clubNoticeDetail(clubBbs_id));
		mav.setViewName("c07");
		return mav;
	}
	
	//공지사항 글쓰기
		//사진 업로드 에러 발생 시 글작성 X
		@Transactional
		public ModelAndView clubNoticeWrite(HashMap<String, String> params, String member_id, String root) {
			ArrayList<String> list2 = new ArrayList<String>();
			clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
			ModelAndView mav = new ModelAndView();
			String page = "redirect:/clubNoticeForm?club_id="+params.get("club_id");
			
			int clubBbs_idx = 0;
			//게시글 수
			int boardCount = clubBbsInter.findCount(Integer.parseInt(params.get("club_id")));
			if(boardCount == 0) {
				clubBbs_idx = 1;
			}else {
				//최근 글번호 가져오기
				ArrayList<ClubBbsDTO> list = clubBbsInter.findIdx(params.get("club_id"));
				clubBbs_idx = list.get(0).getClubBbs_idx() + 1;
			}
			
			int count = Integer.parseInt(params.get("count"));
			logger.info("textarea 파일 수 : "+count);
			
			for(int i=0;i<count;i++) {
				String file= params.get("filePath"+i);
				list2.add(file);
				logger.info("파일list : "+list2.get(i));
			}

			//파라미터 값 추출
			ClubBbsDTO dto = new ClubBbsDTO();
			dto.setMember_id(member_id);
			dto.setClubBbs_subject(params.get("subject"));
			dto.setClubBbs_content(params.get("editor"));
			dto.setClub_id(Integer.parseInt(params.get("club_id")));
			dto.setClubBbs_sort(params.get("sort"));
			dto.setClubBbs_idx(clubBbs_idx);
			
			if(clubBbsInter.clubWrite(dto) == 1) {
				page = "redirect:/clubNoticeDetail?club_id="+params.get("club_id")+"&clubBbs_id="+dto.getClubBbs_id();
				for (String key : fileList.keySet()) {
					int success = 0;
					for(String fileName:list2) {
						if(key.equals(fileName)) {
							success = clubBbsInter.writeFile(key,fileList.get(key),dto.getClubBbs_id());
						}
					}
					if(success < 1) {
						String fullPath = root+"resources/multiuploader/"+key;
						File file = new File(fullPath);
						if(file.exists()) {//삭제할 파일이 존재 한다면
							file.delete();//파일 삭제
							logger.info("파일 삭제");
						}else {
							logger.info("이미 삭제된 사진");
						}
					}
					logger.info("파일 작성 : "+success);
				}
			}
			fileList.clear();
			mav.setViewName(page);
			return mav;
		}
		
	/*************************************파일업로드***************************************/

	//파일 업로드
	public void clubFileUpload(HttpServletRequest request, HttpServletResponse response) {
		logger.info("파일 서비스 접근");
		
		try {
		//파일정보
		String sFileInfo="";
		//파일명을 받는다 - 원본 파일명
		String fileName = request.getHeader("file-name");
		//파일 확장자
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		//확장자를 소문자로 변경
		ext = ext.toLowerCase();
		
		//확장자 검증 배열 변수
		String[] allow_file = {"jpg","png","bmp","gif"};
		
		//allow_file에 있는 확장자인지 검사
		int cnt = 0;
		for (int i = 0; i < allow_file.length; i++) {
			if(ext.equals(allow_file[i])) {
				cnt++;
			}
		}
		
		//없는 확장자일 경우
		if(cnt == 0) {
			PrintWriter print = response.getWriter(); 
			print.print("NOTALLOW_"+fileName); 
			print.flush(); 
			print.close();
		}else {
			//파일 기본 경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			//파일 저장 경로
			String filePath = dftFilePath+"resources"+File.separator+"multiuploader"+File.separator;
			System.out.println(filePath);
			System.out.println(fileName);
			
			//폴더가 없을 경우 폴더 생성
			File dir = new File(filePath);
			if (!dir.exists()) {
				logger.info("폴더 생성 시작");
				dir.mkdir();
			}
			String realFileNm = "";
			SimpleDateFormat fomatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = fomatter.format(new java.util.Date());
			//UUID.randomUUID()을 사용하여 파일명이 중복되지 않도록 처리 = newFile명
			realFileNm = today+System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			
			//서버에 파일 쓰기
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			//b의 길이만큼을 읽어 byte[] b의 0에 저장하고 읽은 바이트 수를 반환
			while((numRead = is.read(b,0,b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			
			//정보 출력
			sFileInfo += "&bNewLine=true";
			//img 태그의 title속성을 원본 파일명으로 적용
			sFileInfo += "&sFileName="+fileName;
			sFileInfo += "&sFileURL="+"/hamo/resources/multiuploader/"+realFileNm;
			PrintWriter print = response.getWriter();
			fileList.put(realFileNm, fileName);
			logger.info("업로드 된 파일 개수 : "+fileList.size());
			print.print(sFileInfo);
			print.flush();
			print.close();
			}	
		}catch (Exception e){
			e.printStackTrace();
		}
	}
		
	
	/*************************************댓글***************************************/
	
	//댓글 리스트
	public HashMap<String, Object> clubReplyList(String clubBbs_id) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		
		//댓글 수 조회
		ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
		logger.info("댓글 수"+replyCount.getClubBbs_replyCount());
		
		//리스트 조회
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("replyCount", replyCount);
		return map;
	}
	
	//댓글 작성
	@Transactional
	public HashMap<String, Object> clubReply(HashMap<String, String> params, String member_id) {
		logger.info("게시글 댓글 작성 서비스 호출");
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ClubBbsDTO dto = new ClubBbsDTO();
		dto.setClubBbsReply_content(params.get("replyContent"));
		dto.setClubBbs_id(Integer.parseInt(params.get("clubBbs_id")));
		dto.setMember_id(member_id);
		System.out.println("회원 아이디 : "+dto.getMember_id());
		
		//댓글 작성
		if(clubBbsInter.clubReply(dto) == 1) {
			//댓글 수 증가
			String clubBbs_id = params.get("clubBbs_id");
			clubBbsInter.replyUp(clubBbs_id);
			//리스트 reload
			ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
			//댓글 수 조회
			ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
			map.put("list", list);
			map.put("replyCount", replyCount);
		}
		return map;
	}
	
	//댓글 삭제
	@Transactional
	public HashMap<String, Object> clubReplyDelete(String clubBbs_id, String clubBbsReply_id) {
		clubBbsInter = sqlSession.getMapper(ClubBbsInter.class);
		//댓글 삭제
		clubBbsInter.replyDelete(clubBbsReply_id);
		//댓글 수 감소
		clubBbsInter.replyDown(clubBbs_id);
		//댓글 리스트 조회
		ArrayList<ClubBbsDTO> list = clubBbsInter.clubReplyList(clubBbs_id);
		//댓글 수 조회
		ClubBbsDTO replyCount = clubBbsInter.findReply(clubBbs_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("replyCount", replyCount);
		return map;
	}


}
