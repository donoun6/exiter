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
public class UserController {
	
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
	
	/**
	 * 아이디/비밀번호 찾기 페이지 접속
	 * @return
	 */
	@GetMapping("/user/find_IdPw/{idOrPw}")
	public String findIdPwFrom(@PathVariable("idOrPw") String idOrPw, HttpServletRequest request) {
		String on = idOrPw + "-on";
		request.setAttribute("on", on);
		return "user/find_IdPw";
	}
	
	/**
	 * 아이디 찾기
	 * @return
	 */
	@PostMapping("/user/findId")
	public String findId(@RequestParam("uName") String uName, @RequestParam("uPhone") String uPhone, RedirectAttributes redirectAttributes) {
		String userId = userService.getUserIdByUNameAndUPhone(uName, uPhone);
		// 해당 정보를 가진 사용자 아이디가 존재하지 않는다면
		if(userId == "") {
			redirectAttributes.addFlashAttribute("idErr", "idErr");
			return "redirect:find_IdPw/id";
		}
		// 존재한다면
		redirectAttributes.addFlashAttribute("userId", userId);
		redirectAttributes.addFlashAttribute("idSuc", "idSuc");
		return "redirect:find_IdPw/id";
	}
	
	/**
	 * 비밀번호 변경이후 페이지 돌아가기(팝업창 띄움)
	 * @return
	 */
	@GetMapping("/user/success_findPw")
	public String successFindPw() {
		return "user/success_findPw";
	}
	
	/**
	 * 비밀번호 찾기
	 * @return
	 */
	String userId; // 아래 PostMapping("/user/changePw")에서도 사용
	@PostMapping("/user/findPw")
	public String findPw(@RequestParam("userId") String checkUserId, @RequestParam("uName") String uName, 
			@RequestParam("uPhone") String uPhone, RedirectAttributes redirectAttributes) {
		userId = checkUserId;
		long checkUser = userService.checkUserForFindPw(userId, uName, uPhone);
		// 해당 정보를 가진 사용자가 존재하지 않는다면
		if(checkUser == 0) {
			redirectAttributes.addFlashAttribute("pwErr", "pwErr");
			return "redirect:find_IdPw/pw";
		}
		// 존재한다면
		return "user/success_findPw";
	}
	
	/**
	 * 비밀번호 변경
	 * @return
	 */
	@PostMapping("/user/changePw")
	public String changePw(@RequestParam("uPasswd1") String uPasswd1, @RequestParam("uPasswd2") String uPasswd2, 
			RedirectAttributes redirectAttributes) {
		// 변경할 비밀번호가 현재 비밀번호와 같다면
		String curPasswd = userService.getUPasswdByUserId(userId);
		if(curPasswd.equals(uPasswd1)) {
			redirectAttributes.addFlashAttribute("pwErr", "pwErr");
			return "redirect:success_findPw";
		}
		// 다르면
		userService.changePasswd(userId, uPasswd1);
		redirectAttributes.addFlashAttribute("pwSuc", "pwSuc");
		return "redirect:success_findPw";
	}
	
	/**
	 * 회원정보 변경 페이지 접근
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/user/update_userInfo")
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
	@PostMapping("/user/update_userInfo")
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
