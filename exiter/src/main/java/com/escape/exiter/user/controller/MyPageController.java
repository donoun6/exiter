package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
public class MyPageController {
	
	@Autowired
	UserService userService;
	
	HttpSession session;
	
	/**
	 * 마이페이지 접속
	 * @param session
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/user/mypage")
	public String MypageForm(HttpSession session, HttpServletRequest request, Model model) {
		session = request.getSession(false);
		
		// 로그인 안되어있을 경우
		if (session == null) {
		model.addAttribute("session", "no");
		return "error/no_session";
		}
		if(session.getAttribute("userId") == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		
		//로그인한 세션으로 닉네임 아이디 등급 등 기본정보 가져오기
		session.getAttribute("userId");
		session.getAttribute("uName");
		session.getAttribute("uGrade");
		
	//현재 예약한 내역 가져오기 regDate부터 예약시간(rDate)까지 내역 뜨게 만들기?
		

		
		return "user/mypage";
	}
	
}
