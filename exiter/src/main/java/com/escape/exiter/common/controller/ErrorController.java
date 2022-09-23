package com.escape.exiter.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	
	HttpSession session;
	// String userId;
	
	@GetMapping("/error/no_session")
	public String noSession() {
		return "error/no_session";
	}
	
}
