package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.escape.exiter.reservation.service.ReservationService;
import com.escape.exiter.user.service.UserService;

@Controller
public class MyPageController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReservationService reservationService;
	
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
		
		// 예약내역
		long uid = (long) session.getAttribute("uid");
		long reserCnt = reservationService.getCntReserByUid(uid);
		model.addAttribute("reserCnt", reserCnt);
		
		// 현재 예약중인 테마
		
		return "user/mypage";
	}
	
}
