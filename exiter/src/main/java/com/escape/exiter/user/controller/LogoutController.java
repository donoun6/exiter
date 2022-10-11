package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class LogoutController {
	
	/**
	 * 로그아웃 기능
	 * @param request
	 * @return
	 */
	@GetMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		// 세션 없을 때
		if (session == null) {
			// 값 던져줄 예정
			return "redirect:/";
		}
		
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * 마이페이지에서 로그아웃 팝업창 띄우기
	 * @param request
	 * @return
	 */
	@GetMapping("/user/logout_pop")
	public String logoutPopUp(HttpServletRequest request) {
		request.setAttribute("myPageLogout", "myPageLogout");
		return "user/mypage";
	}
	
	/**
	 * 푸터의 로그아웃 버튼 클릭시 로그아웃 팝업창 띄우기
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/user/logout_pop2")
	public String logoutPopUp2(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String referer = (String)request.getHeader("REFERER");
		String correntPage = "";
		String[] arr = referer.split("/");
		if(arr[arr.length-1].equals("exiter")) {
			referer = "redirect:/";
			correntPage = "/";
		} else {
			referer = arr[arr.length-2] + "/" + arr[arr.length-1];
			correntPage = "/" + arr[arr.length-2] + "/" + arr[arr.length-1];
		}

		request.setAttribute("logoutF", "logoutF");
		redirectAttributes.addFlashAttribute("logoutF", "logoutF");
		request.setAttribute("correntPage", correntPage);
		redirectAttributes.addFlashAttribute("correntPage", correntPage);
		return referer;
	}
	
	/**
	 * 헤더의 로그아웃 버튼 클릭시 로그아웃 팝업창 띄우기
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/user/logout_pop3")
	public String logoutPopUp3(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String referer = (String)request.getHeader("REFERER");
		String correntPage = "";
		String[] arr = referer.split("/");
		if(arr[arr.length-1].equals("exiter")) {
			referer = "redirect:/";
			correntPage = "/";
		} else {
			referer = arr[arr.length-2] + "/" + arr[arr.length-1];
			correntPage = "/" + arr[arr.length-2] + "/" + arr[arr.length-1];
		}

		request.setAttribute("logoutH", "logoutH");
		redirectAttributes.addFlashAttribute("logoutH", "logoutH");
		request.setAttribute("correntPage", correntPage);
		redirectAttributes.addFlashAttribute("correntPage", correntPage);
		return referer;
	}
}
