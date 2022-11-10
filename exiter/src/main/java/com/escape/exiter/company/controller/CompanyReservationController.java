package com.escape.exiter.company.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.domain.CompanyReservation;
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
		String date = LocalDate.now().toString();
		model.addAttribute("date",date);
		if (request.getParameter("date") != null) {
			date = request.getParameter("date");
		}
		model.addAttribute("date",date);
		List<CompanyReservation> getTheme = companyService.getReservationThemeInfo(cid, date);
		
		List<List<CompanyReservation>> list = new ArrayList<List<CompanyReservation>>();
		for(int i = 0; i < getTheme.size(); i++) {
			long tid = getTheme.get(i).getTid();
			list.add(companyService.getReservationInfoByDateAndTid(cid, date, tid));
		}
		model.addAttribute("getTheme",getTheme);
		model.addAttribute("reservationInfo",list);
		return "company/company_reservation";
	}
	
	@PostMapping
	public String company(HttpServletRequest request) {
		String rid = request.getParameter("rid");
		companyService.deleteReservation(rid);
		return "redirect:/company/company_reservation";
		
	}
}