package com.escape.exiter.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.escape.exiter.reservation.service.ReservationService;

@Controller
public class DeleteReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	HttpSession session;
	
	@GetMapping("/reservation/delete_reser/{rid}")
	public String deleteReservation(@PathVariable("rid") long rid, Model model, HttpServletRequest request) {
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
		
		long uid = (long) session.getAttribute("uid");
		
		reservationService.deleteReservation(rid, uid);
		return "/common/success_delete";
	}
}
