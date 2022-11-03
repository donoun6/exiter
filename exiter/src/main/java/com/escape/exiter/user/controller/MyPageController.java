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
				// 이전 일시인 경우
				afterList.remove(0);
				if(afterList.size() == 0) {
					break;
				}
				reser = afterList.get(0);
				continue;
			} else {
				// 같거나 이후 일시인 경우
				model.addAttribute("reser", reser);
				break;
			}
		}
		
		// 등급 조정
		String preUGrade = userService.getUGradeByUid(uid);
		long beforeCnt = reservationService.getBeforeReservationCount(uid);
		String newUGrade = "";
		if(beforeCnt < 30 && !preUGrade.equals("방린이")) {
			// 지난 예약 개수 30  미만인 경우
			userService.updateUGrade(uid, "방린이");
			newUGrade = userService.getUGradeByUid(uid);
		} else if(beforeCnt > 29 && beforeCnt < 60 && !preUGrade.equals("방소년")) {
			// 지난 예약 개수 30 이상 60 미만인 경우
			userService.updateUGrade(uid, "방소년");
			newUGrade = userService.getUGradeByUid(uid);
		} else if(beforeCnt > 59 && beforeCnt < 100 && !preUGrade.equals("방으른")) {
			// 지난 예약 개수 60 이상 100 미만인 경우
			userService.updateUGrade(uid, "방으른");
			newUGrade = userService.getUGradeByUid(uid);
		} else if(beforeCnt > 99 && !preUGrade.equals("엑시터")) {
			// 지난 예약 개수 100 이상인 경우
			userService.updateUGrade(uid, "엑시터");
			newUGrade = userService.getUGradeByUid(uid);
		}
		
		model.addAttribute("preUGrade", preUGrade);
		model.addAttribute("newUGrade", newUGrade);
		return "user/mypage";
		
	}
	
}
