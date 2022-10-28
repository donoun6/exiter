package com.escape.exiter.reservation.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("cid", theme.getCid());
		model.addAttribute("cnt", cnt);
		model.addAttribute("tPrice", tPrice);
		model.addAttribute("company", company);
		return "reservation/reservation";
	}
	
	@RequestMapping("checkReservationTime")
	@ResponseBody
	public List<Object> CheckReservationTime(@RequestBody Map<String, Object> allData) {
		long tid = (int)allData.get("tid");
		String date = (String)allData.get("date");
		List<Object> time = reservationService.findReservationTime(date, tid);
		return time;
	}
	
	@PostMapping
	public String Reservation(@ModelAttribute("reservation") ReservationDomain reservation, Model model,HttpServletRequest request) {
		reservationService.addReservation(reservation);
		return "redirect:/reservation/all_reser_lists";
	}
}
