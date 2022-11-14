package com.escape.exiter.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.escape.exiter.board.domain.BoardDomain;
import com.escape.exiter.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	HttpSession session;
	
	@GetMapping("/board/board")
	public String BoardPage(Model model, HttpServletRequest request) {
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
		
		model.addAttribute("boardInfo",boardService.boardInfoByUid());
		return "/board/board";
	}
	
	@GetMapping("/board/boardDetail/{bid}")
	public String BoardDetailPage(@PathVariable("bid") long bid, Model model, HttpServletRequest request) {
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
		return "/board/boardDetail";
	}
	
	@GetMapping("/board/boardWrite")
	public String boardWriteFrom(Model model, HttpServletRequest request) {
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
		model.addAttribute("board", new BoardDomain());
		return "/board/boardWrite";
	}
	
	@PostMapping("/board/boardWrite")
	public String boardWrite(@ModelAttribute("board") BoardDomain board, Model model) {
		boardService.addBoard(board);
		return "redirect:/board/board";
	}
	
}