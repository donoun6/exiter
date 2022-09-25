package com.escape.exiter.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
<<<<<<< HEAD
@RequestMapping("/company/company")
public class CompanyController {

	@GetMapping
	public String companyForm() {
		return "company/company";
=======
@RequestMapping("/company")
public class CompanyController {
	
	@GetMapping
	public String Company() {
		return "company/company";
		
>>>>>>> a406ae2ae8a2df1bcf5c45a131fd3701bacb2967
	}
}
