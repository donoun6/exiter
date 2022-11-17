package com.escape.exiter.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		
		
		return "/board/board";
	}
	
	@GetMapping("/board/ajax")
	public String ajax2(Model model, HttpServletRequest request, HttpServletResponse response) {
//		두번째 방법 (코드가 짧지만 슬라이드가 안먹힌다.)
		
		String category = request.getParameter("category");
		String category2 = request.getParameter("category2");
		
		session.setAttribute("category2", category2);
		model.addAttribute("category2",category2);
		model.addAttribute("boardInfo",boardService.boardInfoByCategory(category));
		
		List<Long> count = new ArrayList<Long>();
		for(int i = 0; i < boardService.boardInfoByCategory(category).size(); i++) {
			long bid = boardService.boardInfoByCategory(category).get(i).getBid();
			count.add(boardService.getCommentCountByBid(bid));
		}
		model.addAttribute("list",count);
		return "/board/boardAjax";
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
		session.removeAttribute("category2");
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