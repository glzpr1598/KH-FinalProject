package com.kh.hamo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션에서 아이디 가져오기
		String userId = (String) request.getSession().getAttribute("userId");
		
		// 로그아웃 상태
		if(userId == null) {
			response.sendRedirect("./loginForm?");
			return false;
		} else {
			return true;
		}
	}

}
