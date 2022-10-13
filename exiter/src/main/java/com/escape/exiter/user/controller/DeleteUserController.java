package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
public class DeleteUserController {

	@Autowired
	UserService userService;
	
	HttpSession session;
	
	/**
	 * 탈퇴하기 팝업 (ajax 활용)
	 * @param userId
	 * @return
	 */
	@RequestMapping("/user/deleteUserCheck")
	public String deleteUserCheck() {
		return "user/deleteUserAjax";
	}
	
	/**
	 * 회원탈퇴
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/deleteUser")
	public String deleteUser(HttpServletRequest request) {
		session = request.getSession(false);
		String userId = (String) session.getAttribute("userId");
		
		userService.deleteUser(userId);
		session.invalidate();
		request.setAttribute("deleteSuc", "deleteSuc");
		return "user/mypage";
	}
	
}
