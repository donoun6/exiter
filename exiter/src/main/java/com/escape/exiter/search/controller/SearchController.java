package com.escape.exiter.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	/**
	 * 테마, 지역/장르 검색
	 * @return
	 */
	@GetMapping("/search/search")
	public String searchForm() {
		return "search/search";
	}
	
	/**
	 * 테마 검색
	 * @return
	 */
	@GetMapping("/search/search_theme")
	public String searchThemeForm() {
		return "search/search_theme";
	}
	
	/**
	 * 지역/장르 검색
	 * @return
	 */
	@GetMapping("/search/search_locagen")
	public String searchLocagenForm() {
		return "search/search_locagen";
	}
}
