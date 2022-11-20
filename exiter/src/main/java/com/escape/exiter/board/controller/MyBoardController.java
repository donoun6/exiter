package com.escape.exiter.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.board.domain.MyBoard;
import com.escape.exiter.board.service.MyBoardService;

@Controller
public class MyBoardController {
	
	@Autowired
	MyBoardService myBoardService;
	
	HttpSession session;
	
	/**
	 * 내가 쓴 게시글 조회
	 * @return
	 */
	@GetMapping("/board/my_board")
	public String myBoardsForm(HttpServletRequest request, Model model) {
		
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
		
		return "board/my_board";
	}
	
	/**
	 * 카테고리에 따라 내가 쓴 게시글 조회 (ajax 활용)
	 * @param category
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/board/getBoards")
	public String getBoardsByCategory(@RequestBody String category, HttpServletRequest request) {
		List<MyBoard> mbList = new ArrayList<MyBoard>();
		long uid = (long) session.getAttribute("uid");

		if(category.equals("not_qna")) {
			// qna 제외 게시글 조회
			mbList = myBoardService.getBoardNotQnaByUid(uid);
			
			// 댓글 업데이트 확인
			for(MyBoard mb : mbList) {
				if(mb.getBcCnt() != mb.getBcCheck()) {
					mb.setBcUpdate(true);
				} else {
					mb.setBcUpdate(false);
				}
			}
			
			request.setAttribute("board", "board");
		} else {
			// qna 게시글 조회
			mbList = myBoardService.getBoardQnaByUid(uid);
			
			// 댓글 업데이트 확인
			for(MyBoard mb : mbList) {
				if(mb.getBcCnt() != mb.getBcCheck()) {
					mb.setBcUpdate(true);
				} else {
					mb.setBcUpdate(false);
				}
			}
			
			request.setAttribute("qna", "qna");
		}
		
		request.setAttribute("mbList", mbList);
		
		return "/board/myBoardAjax";
	}
}
