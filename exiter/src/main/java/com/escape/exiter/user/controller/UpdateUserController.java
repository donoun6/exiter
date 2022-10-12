package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
@RequestMapping("/user/update_userInfo")
public class UpdateUserController {

	@Autowired
	UserService userService;
	
	HttpSession session;
	
	/**
	 * 회원정보 변경 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping
	public String updateUserInfoForm(HttpServletRequest request, Model model) {
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
		
		//로그인한 세션으로 회원정보 가져오기
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUserByUserId(userId);
		model.addAttribute("user", user);
		
		return "user/update_userInfo";
	}
	
	/**
	 * 회원정보 변경
	 * @param command
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping
	public String updateUserInfo(UserCommand command, RedirectAttributes redirectAttributes) {
		User user = new User();
		user.setUserId(command.getUserId());
		user.setUPasswd(command.getUPasswd1());
		user.setUName(command.getUName());
		user.setUPhone(command.getUPhone());
		userService.updateUserInfo(user);
		
		redirectAttributes.addFlashAttribute("suc", "suc");
		return "redirect:update_userInfo";
	}
}
