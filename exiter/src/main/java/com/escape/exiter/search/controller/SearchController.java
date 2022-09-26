package com.escape.exiter.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.exiter.search.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;

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
	
	/**
	 * 테마 검색 (ajax 활용)
	 * @param tName
	 * @return
	 */
	@RequestMapping(value="/search/checkTName")
	@ResponseBody
	public List<Map<Object, Object>> tNameCheck(@RequestBody String tName) {
		List<Map<Object, Object>> themeList = searchService.getThemeList(tName);
		
		return themeList;
	}
}
