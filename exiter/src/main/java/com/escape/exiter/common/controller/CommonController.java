package com.escape.exiter.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommonController {
	
	/**
	 * 준비중입니다 페이지 이동
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("common/get_ready")
	public String getReady(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String referer = (String)request.getHeader("REFERER");
		String correntPage = "";
		String[] arr = referer.split("/");
		if(arr[arr.length-1].equals("exiter")) {
			referer = "redirect:/";
			correntPage = "/";
		} else {
			referer = "redirect:/" + arr[arr.length-2] + "/" + arr[arr.length-1];
			correntPage = "/" + arr[arr.length-2] + "/" + arr[arr.length-1];
		}
		
		redirectAttributes.addFlashAttribute("popUp", "popUp");
		redirectAttributes.addFlashAttribute("correntPage", correntPage);
		
		return referer;
	}
	
	/**
	 * 예약취소 완료 팝업페이지 이동
	 * @return
	 */
	@GetMapping("/common/success_delete")
	public String successDelete() {
		return "common/success_delete";
	}
}
