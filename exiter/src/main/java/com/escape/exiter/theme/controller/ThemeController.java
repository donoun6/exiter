package com.escape.exiter.theme.controller;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.service.CompanyService;
import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.service.ThemeService;

@Controller
public class ThemeController {
	
	@Autowired
	ThemeService themeService;
	
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/theme/theme/{tid}")
	public String themeDetailPage(@PathVariable("tid") long tid, Model model) {
		Theme theme = themeService.getThemeByTid(tid);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String tPrice = decFormat.format(theme.getTPrice());
		Company company = companyService.companyInfo(theme.getCid());
		
		model.addAttribute("theme", theme);
		model.addAttribute("tPrice", tPrice);
		model.addAttribute("company", company);
		return "theme/theme";
	}
}
