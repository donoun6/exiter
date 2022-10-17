package com.escape.exiter.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ReservationController {

	/*
	 * 예약페이지
	 * @return
	 * */
	@GetMapping("/theme/reservation/{tid}")
	public String ReservationForm(@PathVariable("tid") long tid, Model model) {
		System.out.println("진입");
		return "reservation/reservation";
	}
}
