package com.escape.exiter.user.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.escape.exiter.user.domain.User;
import com.escape.exiter.user.service.UserService;

@Controller
public class AddUserController {
	
	@Autowired
	UserService userService;
	
	HttpSession session;
	
	/**
	 * 회원가입 페이지 접속
	 * @return
	 */
	@GetMapping("/user/add_user")
	public String addUserForm() {
		return "user/add_user";
	}
	
	/**
	 * 회원가입 및 로그인시 아이디 유효성 검사(ajax 활용)
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user/checkId")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String userId) {
		long cnt = userService.getUserCountByUserId(userId);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("cnt", cnt);
		
		return map;
	}
	
	/**
	 * 회원가입 등록
	 * @param command
	 * @param request
	 * @return
	 */
	@PostMapping("/user/add_user")
	public String addUser(UserCommand command, RedirectAttributes redirectAttributes) {
		User user = new User();
		user.setUserId(command.getUserId());
		user.setUPasswd(command.getUPasswd1());
		user.setUName(command.getUName());
		user.setUPhone(command.getUPhone());
		userService.addUser(user);
		redirectAttributes.addFlashAttribute("success", "success");
		
		return "redirect:add_user";
	}

}
