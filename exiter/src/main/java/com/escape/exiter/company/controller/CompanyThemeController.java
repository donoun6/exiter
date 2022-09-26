package com.escape.exiter.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	HttpSession session;
	
	@GetMapping
	public String companyThemeForm(Model model, HttpServletRequest request) {
		model.addAttribute("company", new CompanyThemeCommand());
		session = request.getSession(false);
		long cid = (long) session.getAttribute("cid");
//		System.out.println(cid);
		companyService.themeInfo(cid);
		model.addAttribute("companyInfo",companyService.themeInfo(cid));
		return "company/company_theme";
}
	@PostMapping
	public String companyTheme(@ModelAttribute("company") CompanyThemeCommand company, Model model) {
		
		companyService.addTheme(company);
		return "redirect:/company/company_theme";
	}
}