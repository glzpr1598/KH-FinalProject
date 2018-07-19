package com.kh.hamo.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoFreeBbsInter;
import com.kh.hamo.dto.HamoBbsDTO;

@Service
public class HamoFreeBbsService {
	//글쓰기 , 수정 폼에서 이미지 업로드 할 경우 fileList 에 해당 파일을 담아줌 ( newFileName , oldFileName  )
	//-> why ? 몇개의 이미지가 업로드 요청이 되었는지 알기 위해
	HashMap<String, String> fileList = new HashMap<String,String>();

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
		if(flag==1) { //flag가 1인 경우에만 조회수 +1
			inter.freeBbsHit(idx);
		}
		HamoBbsDTO freeBbsdetail = inter.freeBbsdetail(idx);
		model.addAttribute("detail", freeBbsdetail);
	}
	//자유게시판 글 수정하기   
	@Transactional
	public ModelAndView freeBbsUpdate(HashMap<String, String> map,String root) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		ModelAndView mav = new ModelAndView();

		int idx = Integer.parseInt(map.get("idx"));
		String content = map.get("content");
		String page ="redirect:/freeBbsUpdateForm?idx="+idx; //수정 실패했을 경우 다시 수정창으로.
		int fileCount = Integer.parseInt(map.get("count"));

		ArrayList<String> newFileNameList = new ArrayList<String>();
		for(int i=0; i<fileCount; i++) {
			String file= map.get("filePath"+i);
			newFileNameList.add(file);
			logger.info("파일list : "+newFileNameList.get(i));
		}

		ArrayList<HamoBbsDTO > dto = new ArrayList<HamoBbsDTO>();
		dto = inter.selectFile(idx);
		logger.info("k 이름 "+dto.get(0).getMainBbsFile_newName());
		logger.info("v 이름 "+dto.get(0).getMainBbsFile_oldName());
		logger.info("dto 사이즈 : "+dto.size());
		for(int i =0; i<dto.size();i++) {
			fileList.put(dto.get(i).getMainBbsFile_newName(), dto.get(i).getMainBbsFile_oldName());
		}

		if(inter.freeBbsFileDel(idx)  > 0 ) { //DB에 해당 게시글에 등록된 이미지를 초기화
			for(String key : fileList.keySet()) {
				logger.info("들어오나 1");
				int success = 0;
				for(String newFile : newFileNameList) {
					logger.info("들어오나 2");
					if(key.equals(newFile)) {
						logger.info("들어오나 3");
						success =inter.freeBbsUpload(idx,key,fileList.get(key));
					}
				}
				if(success < 1) {
					logger.info("삭제");
					String fullPath = root+"resources/photo_upload/"+key;
					File file = new File(fullPath);
					if(file.exists()) {//삭제할 파일이 존재 한다면
						file.delete();//파일 삭제
						logger.info("파일 삭제");
					}else {
						logger.info("이미 삭제된 사진");
					}
				}
			}
		}
		//글쓰기 수정
		if(inter.freeBbsUpdate(idx,content) > 0 ) { 
			page = "redirect:/freeBbsdetail?idx="+idx+"&updateAfter=0";
		}		
		mav.setViewName(page);

		return  mav;
	}
	//자유게시판 글쓰기
	@Transactional
	public ModelAndView freeBbsWrite(HashMap<String, String> map,String root) {
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		ModelAndView mav = new ModelAndView();
		ArrayList<String> newFileNameList = new ArrayList<String>();

		//글쓰기 실패 시 글쓰기 폼 창으로 이동
		String page = "redirect:/freeBbsWriteForm";
		logger.info("글쓰기를 요청한 회원 : "+map.get("userId"));

		int count = Integer.parseInt(map.get("count"));
		logger.info("textarea 파일 수 : "+count);

		for(int i=0;i<count;i++) {
			String file= map.get("filePath"+i);
			newFileNameList.add(file);
			logger.info("파일list : "+newFileNameList.get(i));
		}
		HamoBbsDTO dto = new HamoBbsDTO();
		dto.setMember_id(map.get("userId"));
		dto.setMainBbs_subject(map.get("subject"));
		dto.setMainBbs_content(map.get("content"));

		//글쓰기 성공 하였다면  > 0
		if( inter.freeBbsWrite(dto) >0) {
			logger.info("글쓰기 성공 ->사진만 관리하는 테이블에 추가요청!!");
			for(String key : fileList.keySet()) {//4
				int success = 0;
				for(String newFileName : newFileNameList) { //3
					/*업로드 했을때 이미지 이름과 최종적으로 글쓰기 저장 버튼을 눌러서 들어간
					 이미지 이름이 같을때 */
					if(key.equals(newFileName)) {
						success =inter.freeBbsUpload(dto.getMainBbs_id(),key,fileList.get(key));
					}
				}
				/*글쓰기는 성공 하였지만
				   업로드 한 상태에서 이미지 지우고 글쓰기 요청했을 경우 서버 폴더에는 이미지가 남아있기 때문에 
				   깔끔하게 삭제 시켜주자.
				 */
				if(success < 1) {
					String fullPath = root+"resources/photo_upload/"+key;
					File file = new File(fullPath);
					if(file.exists()) {//삭제할 파일이 존재 한다면
						file.delete();//파일 삭제
						logger.info("파일 삭제");
					}else {
						logger.info("이미 삭제된 사진");
					}
				}
				//파일 업로드 여부
				logger.info("파일 업로드 여부 : "+success);
			}
			//글쓰기 한 후에 글 번호를 가져오는 이유는 해당 게시글 상세보기 페이지로 이동시켜주기위해
			logger.info("글쓰기 한 후에 반환 받은 고유 글 번호 : "+dto.getMainBbs_id());
			page ="redirect:/freeBbsdetail?idx="+dto.getMainBbs_id()+"&updateAfter=0";

		}

		fileList.clear();
		logger.info("최종적으로 가는 페이지 : "+page);
		mav.setViewName(page);
		return mav;
	}
	//자유게시판 글삭제
	@Transactional
	public void freeBbsWrite(String idx,String root) {
		logger.info("글 삭제 요청!");
		inter = sqlSession.getMapper(HamoFreeBbsInter.class);
		//삭제하려고 하는 글에 몇개의 이미지가 있는지 확인
		ArrayList<String> newFileName = new ArrayList<String>();
		newFileName = inter.freeBbsImage(idx);
		logger.info(idx+"번 글에는 "+newFileName.size()+"개의 이미지가 있습니다.");

		if(newFileName.size() >0) {
			//해당 게시글을 삭제하면 , 
			//서버 폴더에 업로드한  이미지를 지워줘야 한다. 쓰레기 제거.
			logger.info("서버 폴더 남아있는 이미지 제거");
			for(int i=0; i<newFileName.size(); i++) {
				String fullPath = root+"resources/photo_upload/"+newFileName.get(i);
				File file = new File(fullPath);
				if(file.exists()) { //해당 경로에 파일이 존재한다면
					//파일 삭제
					logger.info("파일 삭제");
					file.delete();
				}
			}		
		}
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
		//(1)댓글id를 기준으로 등록한 회원의 id와 삭제를 하려는 회원의 id가 맞는지 비교하고 맞을 경우 삭제 요청
	//	String id = inter.freeBbsReply_IdCheck(Integer.parseInt(params.get("reply_id")));
	//	boolean aaa = params.get("member_id").equals(id);
	//	logger.info("맞냐??? "+aaa);
		//(1)번 조건에 충족한다면 댓글 삭제 요청
//		if(params.get("member_id").equals(id)) {
		//	map.put("reply_request","ok");

			int success = inter.freBbsReplyDel(Integer.parseInt(params.get("reply_id")));
			if(success>0) { //댓글삭제에 성공 하였다면
				//댓글을 삭제 해당 글의 댓글 수를 -1 해줘야함.(반환값은 필요 없음)
				String flag ="minus"; 
				inter.reply_countUpdate(Integer.parseInt(params.get("mainBbs_id")),flag);
				//댓글 수가 update 되고 조회해 오기
				map.put("reply", inter.reply_count(Integer.parseInt(params.get("mainBbs_id"))));
			}
//		}
		return map;
	}
	public void hamoFreeBbsUpload(HttpServletRequest request, HttpServletResponse response) {
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
			String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
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
			sFileInfo += "&sFileURL="+"/hamo/resources/photo_upload/"+realFileNm;
			logger.info("sFileInfo: :  "+sFileInfo);
			PrintWriter print = response.getWriter();
			fileList.put(realFileNm, filename); // newFileName , oldFileName
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}



}
