package com.escape.exiter.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.service.ReservationService;

@Controller
public class ReservationListController {
	
	@Autowired
	ReservationService reservationService;
	
	HttpSession session;
	
	@GetMapping("/reservation/all_reser_lists")
	public String allReserListsFrom(HttpServletRequest request, Model model) {
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
		List<ReserThemeCom> afterList = reservationService.getReservationsAfterToday(uid);
		List<ReserThemeCom> beforeList = reservationService.getReservationsBeforeToday(uid);
		
		if(afterList.size() == 0 && beforeList.size() == 0) {
			request.setAttribute("notReser", "notReser");
			return "reservation/reser_list";
		}
		
		request.setAttribute("afterList", afterList);
		request.setAttribute("beforeList", beforeList);
		return "reservation/reser_list";
	}
	
	@GetMapping("/reservation/after_reser_list")
	public String afterReserListForm(HttpServletRequest request, Model model) {
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
		List<ReserThemeCom> afterList = reservationService.getReservationsAfterToday(uid);
		
		if(afterList.size() == 0) {
			request.setAttribute("notReser", "notReser");
			return "reservation/reser_list";
		}
		
		request.setAttribute("afterList", afterList);
		request.setAttribute("moreList", "moreList");
		return "reservation/reser_list";
	}
	
	
}
