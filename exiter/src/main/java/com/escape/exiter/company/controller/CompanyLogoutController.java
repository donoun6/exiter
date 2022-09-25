package com.escape.exiter.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("company/company_logout")
public class CompanyLogoutController {
	
	/**	로그아웃 처리
	 * @param request 세션을 가져와 담는 JSP 내장 객체
	 * @return
	 */
	@GetMapping
	public String CompanyLogout(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate(); //세션 무효화
		
		return "company/company_logout";
	}

}
