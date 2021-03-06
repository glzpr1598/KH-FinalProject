package com.kh.hamo.controller;


import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dto.HamoMemberDTO;
import com.kh.hamo.service.HamoMemberService;

@Controller
public class HamoMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	HamoMemberService service;
	
	/**로그인페이지이동 - 김응주 */	
	@RequestMapping(value="/loginForm")
	public String loginForm(Model model, HttpServletRequest request) {
		logger.info("로그인페이지이동");
		
		// 이전 주소
		String referer = request.getHeader("Referer");
		
		// 이전 주소가 회원가입 페이지면 메인 페이지로
		String command = referer.substring(referer.lastIndexOf('/'));
		if(command.equals("/hamoJoinForm")) {
			referer = referer.replace("/hamoJoinForm", "/");
		}
		
		// 모델에 담아서 보냄
		model.addAttribute("referer", referer);
		
		return "m01";
	}
	
	/**회원가입 페이지이동 - 김응주 */	
	@RequestMapping(value="/hamoJoinForm")
	public String hamoJoinForm() {
		logger.info("회원가입페이지이동");
		return "m04";
	}
	
	/**회원가입 아이디 중복체크 - 김응주 */	
	@RequestMapping(value="/idOverlay")
	public @ResponseBody HashMap<String, Integer> idOverlay(@RequestParam String id) {
		System.out.println(id+"사용자가 입력한 아이디값은?");
		logger.info("아이디중복검사(컨트롤러)");
		int idLength = id.length();
		return service.idOverlay(id,idLength);
	}
	
	/**회원가입 이메일 중복검사 - 김응주 */
	@RequestMapping(value="/emailOverlay")
	public @ResponseBody HashMap<String, Integer> emailOverlay(@RequestParam String email) {
		System.out.println(email+"사용자가 입력한 이메일값은?");
		logger.info("이메일중복검사(컨트롤러)");
		return service.emailOverlay(email);
	}
	
	/**회원가입&비밀번호찾기 이메일 본인인증 - 김응주 */
	@RequestMapping(value = "/emailChk")
	public @ResponseBody HashMap<String, Object> 
		emailChk(@RequestParam String email, HttpServletRequest request, ModelMap mo) throws AddressException, MessagingException { 
		
		String host = "smtp.gmail.com"; 
		
		final String username = "kimeungju17"; 		//발신 구글아이디 @ 부터 생략
		final String password = "hamo1234!"; 			//발신 구글 비밀번호
		int port=465; 		//포트번호
		// 메일 내용 
		
		Random random = new Random();
		int result = random.nextInt(1000000)+100000;
		if(result>1000000){
		    result = result - 100000;
		}
		String serial = Integer.toString(result);	// 인증번호
		
		String recipient = email; 		//받는 사람의 메일주소
		String subject = "Hamo에서 인증번호를 안내해드립니다."; 			//메일 제목
		String body = "인증번호는 ["+serial+"] 입니다."; 		//메일 내용
		Properties props = System.getProperties();			// 정보를 담기 위한 객체 생성 
		
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host); 
		
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
				String un=username; 
				String pw=password; 
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
						return new javax.mail.PasswordAuthentication(un, pw); 
				} 
		}); 
		session.setDebug(true); //for debug 
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("kimeungju17@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
			
		
		mimeMessage.setSubject(subject); //제목셋팅
		mimeMessage.setText(body); //내용셋팅
		Transport.send(mimeMessage);//javax.mail.Transport.send() 이용
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("serialNumber", serial);
		return map;
	}

	/**회원가입 - 김응주 */	
	@RequestMapping(value="/hamoJoin")
	public @ResponseBody HashMap<String, Integer>
	hamoJoin(@RequestParam HashMap<String, String> params) {

		String hash;

		HamoMemberDTO Memberdto = new HamoMemberDTO();

		Memberdto.setMember_id(params.get("id"));
		//패스워드 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		hash = encoder.encode(params.get("pw"));
		Memberdto.setMember_pw(hash);
		Memberdto.setMember_name(params.get("name"));	
		Memberdto.setMember_phone(params.get("phone"));
		Memberdto.setMember_email(params.get("email"));	
		Memberdto.setMember_location(params.get("select4")); // 지역

		String id = params.get("id");
		String select1 = params.get("select1"); //관심사1  선택을 안했을경우 "소분류" 값이 들어온다.
		String select2 = params.get("select2"); //관심사2
		String select3 = params.get("select3"); //관심사3


		return service.join(Memberdto, select1, select2, select3, id);
	}

	/**로그인 - 김응주 */	
	@RequestMapping(value="/login")
	public @ResponseBody HashMap<String, Object> login(
			@RequestParam String userId, String userPw, HttpSession session) {
		logger.info("로그인요청");

		String pwSuccess = service.pwlogin(userId);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// 패스워드 일치 여부
		boolean success = encoder.matches(userPw, pwSuccess);
		
		// 로그인 성공 시 세션 등록
		if(success) {
			session.setAttribute("userId", userId);
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("success", success);
		
		return result;
	}
		
	/**아이디 & 비밀번호 찾기로 이동 - 김응주 */	
	@RequestMapping(value="/idpwSearchForm")
	public String idpwSearchForm() {
		logger.info("아이디 & 비밀번호 찾기로 이동");
		return "m02";
	}

	/**아이디 찾기 - 김응주 */	
	@RequestMapping(value="/idSearch")
	public @ResponseBody HashMap<String, Object> 
		idSearch(@RequestParam HashMap<String,String> params) {
		
		logger.info("아이디찾기요청(컨트롤러)");
		String userName = params.get("name");
		String email = params.get("email");
		
		String userId = service.idSearch(userName, email);
		
		logger.info("userId : " + userId);
		boolean success=false;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(userId == null) {
			userId = "해당 조건의 아이디를 찾을 수 없습니다.";
			map.put("success", success);
			map.put("userId", userId);
		}else {
			success = true;
			map.put("success", success);
			map.put("userId", userId);
		}
		return map;
	}
	
	/**비밀번호 찾기 페이지로 이동 - 김응주 */	
	@RequestMapping(value="/pwSearch")
	public @ResponseBody HashMap<String, Object> 
		pwSearch(@RequestParam HashMap<String,String> params) {
		
		logger.info("비밀번호찾기페이지로 이동(컨트롤러)");
		String userId = params.get("userId");
		String email = params.get("email");
		
		String pw = service.pwSearch(userId, email);
		boolean success = false;
		logger.info("비밀번호 찾기 여부 : " + success);

		HashMap<String, Object> map = new HashMap<String, Object>();
		if(pw != null) {
		success = true;
		map.put("success", success);
		}
		return map;
	}

	/**비밀번호 수정 - 김응주*/
	@RequestMapping(value="/pwUpdate")
	public @ResponseBody HashMap<String, Object> 
		pwUpdate(@RequestParam HashMap<String,String> params) {
	
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		logger.info("비밀번호 수정(컨트롤러)");
		String pw = encoder.encode(params.get("pw"));
		String id = params.get("id");
		
		boolean success = false;
		success = service.pwUpdate(id, pw);
		logger.info("비밀번호 찾기 여부 : " + success);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	/**수정폼 - 김응주*/
	@RequestMapping(value="/updateForm")
	public ModelAndView pwUpdate(HttpSession session, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		logger.info("멤버 수정폼 요청");
		return service.updateForm(userId, request);
	}
	
	/**비밀번호 수정 (새창) - 김응주 */
	@RequestMapping(value="/pwUpdate2")
	public ModelAndView pwUpdate2(@RequestParam String userId) {
		logger.info("비밀번호 찾기 (새창)");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m06");	
		mav.addObject("userId", userId);
		return mav;
	}
	/**이메일 수정 (새창) - 김응주 */
	@RequestMapping(value="/emailUpdate2")
	public ModelAndView emailUpdate2(@RequestParam String userId) {
		logger.info("이메일 찾기 (새창)");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m07");	
		mav.addObject("userId", userId);
		return mav;
	}
	
	/**회원정보수정 - 김응주 */	
	@RequestMapping(value="/userUpdate")
	public @ResponseBody HashMap<String, Integer>
	userUpdate(@RequestParam HashMap<String, String> params) {

		HamoMemberDTO Memberdto = new HamoMemberDTO();
		Memberdto.setMember_id(params.get("id"));
		Memberdto.setMember_name(params.get("name"));	
		Memberdto.setMember_phone(params.get("phone"));
		Memberdto.setMember_location(params.get("select4")); // 지역

		String select1 = params.get("select1"); //관심사1  선택을 안했을경우 "소분류" 값이 들어온다.
		String select2 = params.get("select2"); //관심사2
		String select3 = params.get("select3"); //관심사3


		return service.userUpdate(Memberdto, select1, select2, select3, params.get("id"));
	}
	
	/**회원정보수정(현재비밀번호 확인) - 김응주 */	
	@RequestMapping(value="/passwordChk")
	public @ResponseBody HashMap<String, Object> 
		passwordChk(@RequestParam String id, String pw) {
		
		logger.info("회원정보수정(현재비밀번호 확인)");

		String pwSuccess = service.pwlogin(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// 패스워드 일치 여부
		boolean success = encoder.matches(pw, pwSuccess);
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("success", success);

		return result;
	}
	
	/**회원정보수정(이메일 업데이트) - 김응주 */	
	@RequestMapping(value="/emailUpdate")
	public @ResponseBody HashMap<String, Object> 
		emailUpdate(@RequestParam String id, String email) {
		
		logger.info("회원정보수정(이메일 업데이트)");

		int success = service.emailUpdate(id,email);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("success", success);

		return result;
	}
	
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		logger.info("로그아웃 요청");
		
		// 세션 삭제
		session.removeAttribute("userId");
		
		// 이전 주소
		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}

	
}
