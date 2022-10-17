package com.escape.exiter.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation/reser_list")
public class ReservationListController {
	
	@Autowired
	ReservationService reservationService;
	
	HttpSession session;
	
	@GetMapping
	public String reserListFrom(HttpServletRequest request) {
		session = request.getSession(false);
		long uid = (long) session.getAttribute("uid");
		List<ReserThemeCom> reserList = reservationService.getReservationsByUid(uid);
		
		request.setAttribute("reserList", reserList);
		return "reservation/reser_list";
	}
	
}
