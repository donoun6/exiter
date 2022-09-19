package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
@RequestMapping("/user/login")
public class LoginController {
	
	@Autowired
	UserService userService;
	HttpSession session;
	
	/**
	 * 로그인 페이지 접속
	 * @return
	 */
	@GetMapping
	public String loginForm() {
		return "user/login";
	}
	
	/**
	 * 로그인 하기
	 * @param user
	 * @param userId
	 * @param uPasswd
	 * @param request
	 * @return
	 */
	@PostMapping
	public String login(User user, @RequestParam String userId, @RequestParam String uPasswd, HttpServletRequest request) {
		
		// 아이디, 비밀번호 존재하지 않을 경우
		if(userService.isValidUser(userId, uPasswd) == false) {
			// 에러메시지 띄울 태그 추가해야함
			String errMsg = "아이디 또는 비밀번호가 틀렸습니다.<br>다시 입력해주세요.";
			request.setAttribute("errMsg", errMsg);
			return "user/login"; // errorMsg 던져서 로그인페이지로 이동
		}
		
		user = userService.getUserByUserId(userId);
		session = request.getSession(true);
		session.setAttribute("userId", userId);
		
		return "redirect:/";
	}
}
