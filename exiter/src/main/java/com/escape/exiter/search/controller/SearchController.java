package com.escape.exiter.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search/search")

public class SearchController {

	/*
	 * 테마, 지역/장르 검색
	 * @return
	 * */
	@GetMapping
	public String searchForm() {
		return "search/search";
	}
}
