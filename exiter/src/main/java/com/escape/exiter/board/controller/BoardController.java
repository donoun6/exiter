package com.escape.exiter.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.border.Border;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.escape.exiter.board.domain.BoardCommentDomain;
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
		
		model.addAttribute("boardInfo1",boardService.boardInfoByCategory("공지사항"));
		model.addAttribute("boardInfo2",boardService.boardInfoByCategory("자유게시판"));
		model.addAttribute("boardInfo3",boardService.boardInfoByCategory("일행구하기"));
		model.addAttribute("boardInfo4",boardService.boardInfoByCategory("Qna"));
		
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
		
		model.addAttribute("boardInfo",boardService.boardInfoByBid(bid));
		model.addAttribute("boardComment",boardService.boardComentByBid(bid));
		model.addAttribute("board", new BoardCommentDomain());
		return "/board/boardDetail";
	}
	
	@PostMapping("/board/boardDetail/{bid}")
	public String BoardDetail(@ModelAttribute("board") BoardCommentDomain board ,@PathVariable("bid") long bid, 
			Model model, HttpServletRequest request) {
		
		boardService.addBoardComment(board);
		return "redirect:/board/boardDetail/"+bid;
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