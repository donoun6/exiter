package com.escape.exiter.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/mypage")
public class MyPageController {
	
	@Autowired
	UserServiceImpl UserService;

	@GetMapping
	public String MypageForm(HttpSession session) {
		//로그인한 세션으로 닉네임 아이디 등급 등 기본정보 가져오기
		session.getAttribute("userId");
		session.getAttribute("uName");
		session.getAttribute("uGrade");
		
	//현재 예약한 내역 가져오기 regDate부터 예약시간(rDate)까지 내역 뜨게 만들기?
		

		
		return "user/mypage";
	}
}
