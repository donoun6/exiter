package com.escape.exiter.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.main.service.MainService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService mainService;	//Service Bean
	
	/*
	 * main page
	 */
	@GetMapping
	public String mainPage(Model model) {
		model.addAttribute("randomImg",mainService.randomImg());
		model.addAttribute("newImg",mainService.newImg());
		return "index";
	}
	
}