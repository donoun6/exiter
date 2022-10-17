package com.escape.exiter.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation/reser_list")
public class ReservationListController {
	
	@GetMapping
	public String reserListFrom() {
		
		return "reservation/reser_list";
	}
}
