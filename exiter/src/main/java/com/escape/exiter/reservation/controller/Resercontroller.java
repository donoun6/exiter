package com.escape.exiter.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reser/reser")
public class Resercontroller {

	/*
	 * 예약페이지
	 * @return
	 * */
	@GetMapping
	public String reserForm() {
		return "reser/reser";
	}
}
