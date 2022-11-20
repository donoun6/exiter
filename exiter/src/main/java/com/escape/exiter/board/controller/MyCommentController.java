package com.escape.exiter.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.escape.exiter.board.domain.MyComment;
import com.escape.exiter.board.service.MyCommentService;

@Controller
public class MyCommentController {
	
	@Autowired
	MyCommentService myComService;
	
	HttpSession session;
	
	/**
	 * 내가 쓴 댓글 조회
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/board/my_comment")
	public String myCommentsForm(HttpServletRequest request, Model model) {
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
		
		List<MyComment> mcList = myComService.getMyCommentsByUid(uid);
		request.setAttribute("mcList", mcList);
		return "board/my_comment";
	}
	
	/**
	 * 선택한 댓글 삭제
	 * @param command
	 * @param request
	 * @return
	 */
	@PostMapping("/board/comCheckDelete")
	public String comCheckDelete(CheckDeleteCommand command, HttpServletRequest request) {
		List<Long> deleteList = command.getDeleteList();
		for(int i = 0; i < deleteList.size(); i++) {
			myComService.deleteCommentByBcid(deleteList.get(i));
		}
		return "redirect:/board/my_comment";
	}
}
