package com.escape.exiter.company.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
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
		
		model.addAttribute("companyInfo", companyService.themeInfo(cid));
		model.addAttribute("reservationInfo", companyService.getReservationInfo(cid));
		
		List<Long> list = new ArrayList<Long>();
		for(int i = 0; i < companyService.themeInfo(cid).size(); i++) {
			long tid =  companyService.themeInfo(cid).get(i).getTid();
			list.add(companyService.getReservationCountByTid(tid));
		}
		model.addAttribute("reservationCount",list);
		
		SimpleDateFormat getYear = new SimpleDateFormat("yyyy");
		Calendar year = Calendar.getInstance(); 
		String currentYear = getYear.format(year.getTime());
		List<String> yearMonth = new ArrayList<String>();
		List<Long> yearMonthCount = new ArrayList<Long>();
		
		for(int i =1; i <= 12; i++) {
			if(i < 10) {
				yearMonth.add("0"+i+"월");
				String rDate = currentYear+"-0"+i;
				yearMonthCount.add(companyService.getReservationMonthCountByCid(rDate, cid));
			}else {
				yearMonth.add(i+"월");
				String rDate = currentYear+"-"+i;
				yearMonthCount.add(companyService.getReservationMonthCountByCid(rDate, cid));
			}
		}
		model.addAttribute("yearMonth",yearMonth);
		model.addAttribute("yearMonthCount",yearMonthCount);
		
		 SimpleDateFormat yDay = new SimpleDateFormat("yyyy-MM-dd");
		 
		 List<String> monthDay = new ArrayList<String>();
		 List<Long> monthDayCount = new ArrayList<Long>();
	     for(int i = -3; i <= +3; i++) {
	    	 Calendar calendar = Calendar.getInstance(); 
	    	 calendar.add(Calendar.DATE, i);
	    	 String days = yDay.format(calendar.getTime()); // String으로 저장
	    	 monthDayCount.add(companyService.getReservationDayCountByCid(days, cid));
	    	 String md = days.split("-")[1]+"/"+days.split("-")[2]; //MM-dd 형태로 자르기
	    	 monthDay.add(md);
	     }
	     model.addAttribute("monthDay",monthDay);
	     model.addAttribute("monthDayCount",monthDayCount);
	     
		return "company/company";
}
}