package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/logout")
public class LogoutController {
	
	@GetMapping
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		// 세션 없을 때
		if (session == null) {
			// 값 던져줄 예정
			return "redirect:/";
		}
		
		session.invalidate();
		return "redirect:/";
	}
}
