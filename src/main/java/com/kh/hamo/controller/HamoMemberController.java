package com.kh.hamo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
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
	
	@RequestMapping(value = "/sample")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	/**로그인페이지이동 - 김응주 */	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		logger.info("로그인페이지이동");
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
	
	/**회원가입 이메일 본인인증 - 김응주 */
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
		String body = "인증번호는 [ "+serial+" ] 입니다."; 		//메일 내용
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
	
		
		

}
