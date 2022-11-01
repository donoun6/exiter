package com.escape.exiter.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("/company/company_reservation")
public class CompanyReservationController {
	//Service Bean
	@Autowired
	CompanyService companyService;
	HttpSession session;
	
	@GetMapping
	public String companyForm(Model model, HttpServletRequest request) {
		session = request.getSession(false);
//		로그인이 안되어있을시 로그인화면으로 보내기
		if (session == null || session.getAttribute("cid") == null){
			return "redirect:/company/company_login";
		}
		long cid = (long) session.getAttribute("cid");
		
		model.addAttribute("reservationInfo", companyService.getReservationInfo(cid));
		return "company/company_reservation";
}
}