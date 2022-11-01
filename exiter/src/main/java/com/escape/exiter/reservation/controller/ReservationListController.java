package com.escape.exiter.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.escape.exiter.reservation.domain.ReserDetail;
import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.service.ReservationService;

@Controller
public class ReservationListController {
	
	@Autowired
	ReservationService reservationService;
	
	HttpSession session;
	
	/**
	 * 모든 예약 목록 확인 페이지 이동
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException 
	 */
	@GetMapping("/reservation/all_reser_lists")
	public String allReserListsFrom(HttpServletRequest request, Model model) throws ParseException {
		session = request.getSession(false);
		
		// 로그인 안되어있을 경우
		if (session == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		if(session.getAttribute("userId") == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		
		long uid = (long) session.getAttribute("uid");
		List<ReserThemeCom> afterList = reservationService.getReservationsAfterToday(uid);
		List<ReserThemeCom> beforeList = reservationService.getReservationsBeforeToday(uid);
		
		// 예약내역이 없을 경우
		if(afterList.size() == 0 && beforeList.size() == 0) {
			request.setAttribute("notReser", "notReser");
			return "reservation/reser_list";
		}
		
		// 오늘 날짜 예약시간 지났는지 확인
		int i = 0;
		while(i < afterList.size()) {
			boolean result = reservationService.reserDateBeforeCheck(afterList.get(i));
			if(result) {
				// 이전 일시인 경우
				beforeList.add(afterList.get(i));
				afterList.remove(i);
				if(afterList.size() == 0) {
					break;
				}
				continue;
			} else {
				i++;
			}
		}
		beforeList = reservationService.reserDateSort(beforeList, "desc");
		
		request.setAttribute("afterList", afterList);
		request.setAttribute("beforeList", beforeList);
		return "reservation/reser_list";
	}
	
	/**
	 * 오늘 이후 예약 목록 페이지 이동
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException 
	 */
	@GetMapping("/reservation/after_reser_list")
	public String afterReserListForm(HttpServletRequest request, Model model) throws ParseException {
		session = request.getSession(false);
		
		// 로그인 안되어있을 경우
		if (session == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		if(session.getAttribute("userId") == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		
		long uid = (long) session.getAttribute("uid");
		List<ReserThemeCom> afterList = reservationService.getReservationsAfterToday(uid);
		
		// 오늘 이후 예약내역이 없을 경우
		if(afterList.size() == 0) {
			request.setAttribute("notReser", "notReser");
			return "reservation/reser_list";
		}
		
		// 오늘 날짜 예약시간 지났는지 확인
		int i = 0;
		while(i < afterList.size()) {
			boolean result = reservationService.reserDateBeforeCheck(afterList.get(i));
			if(result) {
				// 이전 일시인 경우
				afterList.remove(i);
				if(afterList.size() == 0) {
					break;
				}
				continue;
			} else {
				i++;
			}
		}

		request.setAttribute("afterList", afterList);
		request.setAttribute("moreList", "moreList");
		return "reservation/reser_list";
	}
	
	/**
	 * 예약 상세 정보 페이지 이동
	 * @param rid
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping("/reservation/reser_detail/{rid}")
	public String reservationDetail(@PathVariable("rid") long rid, Model model, HttpServletRequest request) {
		session = request.getSession(false);
		
		// 로그인 안되어있을 경우
		if (session == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		if(session.getAttribute("userId") == null) {
			model.addAttribute("session", "no");
			return "error/no_session";
		}
		
		long uid = (long) session.getAttribute("uid");
		ReserDetail reser = reservationService.getReservationDetail(rid, uid);
		model.addAttribute("reser", reser);
		
		return "reservation/reser_detail";
	}
	
}
