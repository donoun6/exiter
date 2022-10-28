package com.escape.exiter.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.escape.exiter.reservation.domain.ReserThemeCom;
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
	 * @throws ParseException 
	 */
	@GetMapping("/user/mypage")
	public String MypageForm(HttpSession session, HttpServletRequest request, Model model) throws ParseException {
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
		List<ReserThemeCom> afterList = reservationService.getReservationsAfterToday(uid);
		// 에약목록이 없으면 바로 마이페이지 이동
		if(afterList.size() == 0) {
			return "user/mypage";
		}
		ReserThemeCom reser = afterList.get(0);
		
		// 오늘 날짜 예약시간 지났는지 확인
		while(reser != null) {
			boolean result = reservationService.reserDateBeforeCheck(reser);
			if(result) {
				// 이전 날짜인 경우
				System.out.println("이전");
				afterList.remove(0);
				if(afterList.size() == 0) {
					break;
				}
				reser = afterList.get(0);
				continue;
			} else {
				// 같거나 이후 날짜인 경우
				model.addAttribute("reser", reser);
				break;
			}
		}
		
		return "user/mypage";
		
	}
	
}
