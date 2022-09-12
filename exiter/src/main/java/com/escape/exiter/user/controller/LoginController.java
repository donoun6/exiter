package com.escape.exiter.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/login")
public class LoginController {
	
	/**
	 * 로그인 페이지 접속
	 * @return
	 */
	@GetMapping
	public String loginForm() {
		return "user/login";
	}
}
