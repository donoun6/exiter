package com.escape.exiter.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.escape.exiter.user.service.UserService;

@Controller
public class FindUserController {

	@Autowired
	UserService userService;
	
	HttpSession session;
	
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
		boolean uCheck = userService.checkDeleteUser(userId);
		if(uCheck) {
			// 탈퇴한 회원이라면
			redirectAttributes.addFlashAttribute("deleteUser", "deleteUser");
			redirectAttributes.addFlashAttribute("find", "id");
			return "redirect:find_IdPw/id";
		}
		// 탈퇴한 회원이 아니라면
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
		boolean uCheck = userService.checkDeleteUser(userId);
		if(uCheck) {
			// 탈퇴한 회원이라면
			redirectAttributes.addFlashAttribute("deleteUser", "deleteUser");
			redirectAttributes.addFlashAttribute("find", "pw");
			return "redirect:find_IdPw/id";
		}
		// 탈퇴한 회원이 아니라면
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
}
