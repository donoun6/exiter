package com.escape.exiter.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.domain.CompanyUserCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("company/company_signUp")
public class CompanySignUpController {
//		Service Bean
	@Autowired
	CompanyService companyService;
	
	/**	회원가입 폼 화면 GET 방식
	 * @param model : form:form 태그 modelAttribute 의 변수를 지정하기 위해 사용
	 */
	@GetMapping
	public String CompanySignUpForm(Model model) {
		model.addAttribute("company", new CompanyUserCommand()); 
		return "company/company_signUp";
	}
	
	/**	회원가입 처리 화면 POST 방식
	 * @param company : 회원가입에 필요한 domain만 가져와 Command클래스를 만들어 변수로 지정
	 * @param model : 위와 같은 이유
	 */
	@PostMapping
	public String CompanySignUp(@ModelAttribute("company") CompanyUserCommand company, Model model) {
		model.addAttribute("company",company);
		
		companyService.addUser(company);
		return "company/company_login";
	}
}
