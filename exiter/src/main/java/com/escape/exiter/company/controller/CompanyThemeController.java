package com.escape.exiter.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("/company/company_theme")
public class CompanyThemeController {
	@Autowired
	CompanyService companyService;
	
	@GetMapping
	public String companyThemeForm() {
		return "company/company_theme";
}
	@PostMapping
	public String companyTheme(@ModelAttribute("company") CompanyThemeCommand company, Model model) {
		
		companyService.addTheme(company);
		return "company/company_theme";
	}
}