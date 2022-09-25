package com.escape.exiter.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@GetMapping
	public String Company() {
		return "company/company";
		
	}
}
