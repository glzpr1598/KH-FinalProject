package com.kh.hamo.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoFreeBbsInter;
import com.kh.hamo.dto.HamoBbsDTO;

@Service
public class HamoFreeBbsService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    HamoFreeBbsInter inter;
    
    //자유게시판 글 리스트 조회
	public void freeBbsList(Model model) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		ArrayList<HamoBbsDTO> freeList = inter.freeBbsList();
		model.addAttribute("freeList", freeList);
	}
	//자유게시판 글 상세보기 
	public void freeBbsdetail(String idx, int flag, Model model) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		if(flag==0) { //flag가 0인 경우에만 조회수 +1
			inter.freeBbsHit(idx);
		}
		HamoBbsDTO freeBbsdetail = inter.freeBbsdetail(idx);
		model.addAttribute("detail", freeBbsdetail);
	}
	//자유게시판 글 수정하기
	public void freeBbsUpdate(HashMap<String, String> map) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		String idx = map.get("idx");
		String content = map.get("content");
		int success = inter.freeBbsUpdate(idx,content);
		logger.info("글 수정 성공 여부 :  "+success); 

	}
	//자유게시판 글쓰기
	public int freeBbsWrite(HashMap<String, String> map) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		HamoBbsDTO dto = new HamoBbsDTO();
		dto.setMainBbs_subject(map.get("subject"));
		dto.setMainBbs_content(map.get("content"));
		int success = inter.freeBbsWrite(dto);	
		logger.info("글쓰기 성공 여부: "+success);
		//글쓰기 한 후에 글번호를 가져오는 이유는 해당 게시글 상세보기 페이지로 이동시켜주기위해
		int mainBbs_id = dto.getMainBbs_id();
		logger.info("글쓰기 한 후에 글 번호 : "+mainBbs_id);
		return mainBbs_id;
	}
	//자유게시판 글삭제
	public void freeBbsWrite(String idx) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		int success = inter.freeBbsDelete(idx);
		logger.info("글쓰기 삭제 여부: "+success);
	}
	//자유게시판 댓글 리스트 +(댓글 개수 가져오기)
	public HashMap<String, Object> freeBbsReplyList(int mainBbs_id) {
		ArrayList<HamoBbsDTO> dto =new ArrayList<HamoBbsDTO>();
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		logger.info("글 번호!!!!"+mainBbs_id);
		//ERD기준으로 글 번호는 NUMBER 형 이기 때문에 치환해주자
		dto= inter.freeBbsReplyList(mainBbs_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reply_list", dto);
		return map;
	}
	
	//자유게시판 댓글 등록 +( 댓글 count 1올려주기 ) 
	public HashMap<String, Object> freeBbsReply(HashMap<String, String> params) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		HamoBbsDTO dto = new HamoBbsDTO();
		int  mainBbs_id = Integer.parseInt(params.get("mainBbs_id"));
		String member_id = params.get("member_id");
		String mainBbsReply_content = params.get("mainBbsReply_content");
		dto.setMainBbs_id(mainBbs_id);
		dto.setMember_id(member_id);
		dto.setMainBbsReply_content(mainBbsReply_content);
		int success = inter.freeBbsReply(dto);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if(success > 0 ) { 
			//DB에 댓글 성공 하였다면 dto에 담긴 데이터가 DB에 들어가있는것이므로 기존 DTO 재활용
			//회원ID ,날짜,내용을 반환해줘야 하므로 dto 에 담긴 ID와 내용을 map형태로 담음
			/************************************************/
			logger.info("댓글 삭제할 때 중요한 키 : "+dto.getMainBbsReply_id());
			//댓글 등록 후 DB에서 날짜를 가져오기 위해 날짜가져오자. 날짜는 쿼리문에서 기본으로SYSDATE로 입력해줬기 때문에
			//쿼리 돌려서 날짜만 SELECT 해와야함.
			dto.setMainBbsReply_date(inter.reply_date(dto.getMainBbsReply_id()));
			logger.info("날짜 : "+dto.getMainBbsReply_date());
			

			//댓글을 등록 했으면 해당 글의 댓글 수를 +1 해줘야함.(반환값은 필요 없음)
			String flag ="plus"; 
			inter.reply_countUpdate(mainBbs_id,flag);
			//댓글 수가 update 되고 조회해 오기
			dto.setMainBbs_replyCount(inter.reply_count(mainBbs_id));
			//최종적으로 jsp 페이지에 결과를 담아서 보내주기 위해 dto를 map형태로 담음
			map.put("reply"	,dto);
			
		}
		return map;
	}
	//자유게시판 댓글 삭제
	public HashMap<String, Object> freBbsReplyDel(HashMap<String, String> params) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = inter.freBbsReplyDel(Integer.parseInt(params.get("reply_id")));
		if(success>0) { //댓글삭제에 성공 하였다면
			//댓글을 삭제 해당 글의 댓글 수를 -1 해줘야함.(반환값은 필요 없음)
			String flag ="minus"; 
			inter.reply_countUpdate(Integer.parseInt(params.get("mainBbs_id")),flag);
			//댓글 수가 update 되고 조회해 오기
			map.put("reply", inter.reply_count(Integer.parseInt(params.get("mainBbs_id"))));
		}
		return map;
	}



}
