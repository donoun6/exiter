package com.escape.exiter.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/add_user")
public class UserController {
	
	/**
	 * 회원가입 페이지 접속
	 * @return
	 */
	@GetMapping
	public String addUserForm() {
		return "user/add_user";
	}
}
