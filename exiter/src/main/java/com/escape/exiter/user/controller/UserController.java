package com.escape.exiter.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
	
	/**
	 * 회원가입 페이지 접속
	 * @return
	 */
	@GetMapping("/user/add_user")
	public String addUserForm() {
		return "user/add_user";
	}
	
	/**
	 * 아이디/비밀번호 찾기 페이지 접속
	 * @return
	 */
	@GetMapping("/user/find_IdPw")
	public String findIdPwFrom() {
		return "user/find_IdPw";
	}
	
	/**
	 * 아이디 찾은 후 페이지 이동
	 * @return
	 */
	@PostMapping("/user/findId")
	public String findId() {
		// 확인 작업 후 이동
		return "user/success_findId";
	}
	
	/**
	 * 비밀번호 찾은 후 페이지 이동
	 * @return
	 */
	@PostMapping("/user/findPw")
	public String findPw() {
		// 확인 작업 후 이동
		return "user/success_findPw";
	}
	
	/**
	 * 비밀번호 변경 후 페이지 이동
	 * @return
	 */
	@PostMapping("/user/changePw")
	public String changePw() {
		// 확인 작업 후 이동
		return "user/success_changePw";
	}
}
