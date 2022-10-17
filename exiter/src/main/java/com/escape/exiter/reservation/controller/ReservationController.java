package com.escape.exiter.reservation.controller;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.service.CompanyService;
import com.escape.exiter.reservation.domain.ReservationDomain;
import com.escape.exiter.reservation.service.ReservationService;
import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.domain.ThemePrice;
import com.escape.exiter.theme.service.ThemeService;

@Controller
@RequestMapping("/theme/reservation/{tid}")
public class ReservationController {
	@Autowired
	ThemeService themeService;
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	ReservationService reservationService;
	
	HttpSession session;
	
	@GetMapping
	public String ReservationForm(@PathVariable("tid") long tid, Model model) {
		model.addAttribute("reservation", new ReservationDomain()); 
		Theme theme = themeService.getThemeByTid(tid);
		long cnt = themeService.getTpCntByTid(tid);
		model.addAttribute("tid",tid);
		
		List<ThemePrice> tpList = themeService.getThemePriceByTid(tid);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String tPrice = decFormat.format(tpList.get(0).getTPrice());
		
		Company company = companyService.companyInfo(theme.getCid());
		
		model.addAttribute("trTime",themeService.getThemeReservationTimeByTid(tid));
		
		model.addAttribute("theme", theme);
		model.addAttribute("cnt", cnt);
		model.addAttribute("tPrice", tPrice);
		model.addAttribute("company", company);
		return "reservation/reservation";
	}
	
	@PostMapping
	public String Reservation(@ModelAttribute("reservation") ReservationDomain reservation, Model model) {
		reservationService.addReservation(reservation);
		return "redirect:/";
	}
}
