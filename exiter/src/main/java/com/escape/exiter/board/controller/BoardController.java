package com.escape.exiter.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.escape.exiter.board.domain.BoardDomain;

@Controller
public class BoardController {
	
	@GetMapping("/board/board")
	public String BoardPage() {
		return "/board/board";
	}
	
	@GetMapping("/board/boardWrite")
	public String boardWriteFrom(Model model, HttpServletRequest request) {
		model.addAttribute("board", new BoardDomain());
		return "/board/boardWrite";
	}
	
	@PostMapping("/board/boardWrite")
	public String boardWrite(@ModelAttribute("board") BoardDomain board, Model model) {
		System.out.println(board.getBTtitle());
		return "/board/boardWrite";
	}
	
}