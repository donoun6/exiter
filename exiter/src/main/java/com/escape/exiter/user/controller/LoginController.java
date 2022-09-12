package com.escape.exiter.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/login")
public class LoginController {

	@GetMapping
	public String loginForm() {
		return "user/login";
	}
}
