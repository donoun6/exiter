package com.escape.exiter.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	HttpSession session;
	
	/**
	 * 로그인 페이지 접속
	 * @return
	 */
	@GetMapping("/user/login")
	public String loginForm() {
		return "user/login";
	}
	
	/**
	 * 로그인 하기
	 * @param user
	 * @param userId
	 * @param uPasswd
	 * @param request
	 * @return
	 */
	@PostMapping("/user/login")
	public String login(User user, @RequestParam String userId, @RequestParam String uPasswd, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		user = userService.getUserByUserId(userId);
		
		if(user.getUCheck()) {
			// 탈퇴한 회원이라면
			redirectAttributes.addFlashAttribute("deleteUser", "deleteUser");
			return "redirect:/user/login";
		}
		
		// 탈퇴한 회원이 아니라면
		session = request.getSession(true);
		session.setAttribute("userId", userId);
		session.setAttribute("uName", user.getUName());
		session.setAttribute("uGrade", user.getUGrade());
		session.setAttribute("uCheck", user.getUCheck());
		
		return "redirect:/";
	}
	
	/**
	 * 로그인 아이디 비밀번호 존재 확인(ajax 활용)
	 * @param allData
	 * @return
	 */
	@RequestMapping(value="/user/checkIdPw")
	@ResponseBody
	public Map<Object, Object> idPwCheck(@RequestBody Map<String, Object> allData) {
		long cnt = userService.checkUser((String)allData.get("userId"), (String)allData.get("uPasswd"));
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("cnt", cnt);
		
		return map;
	}
}
