package com.escape.exiter.search.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.exiter.search.service.SearchService;
import com.escape.exiter.theme.domain.Theme;

@Controller
public class SearchThemeController {
	
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
	public String searchThemeForm(HttpServletRequest request) {
		List<Map<Object, Object>> themeList = searchService.getThemeList();
		Collections.shuffle(themeList);
		request.setAttribute("allThemeList", themeList);
		
		return "search/search_theme";
	}
	
	/**
	 * 테마 검색 (ajax 활용)
	 * @param tName
	 * @return
	 */
	@RequestMapping(value="/search/checkTName")
	@ResponseBody
	public List<Map<Object, Object>> tNameCheck(@RequestBody String tName) {
		List<Map<Object, Object>> themeList = new ArrayList<Map<Object,Object>>();
		if(tName.equals("+")) {
			// 빈칸일때 전체 테마 리스트 조회
			themeList = searchService.getThemeList();
		} else {
			themeList = searchService.getThemeList(tName);
		}
		Collections.shuffle(themeList);
		return themeList;
	}
	
	/**
	 * 테마 상세정보 팝업 (ajax 활용)
	 * @param allData
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/search/themeDetail")
	public String themeDetail(@RequestBody Map<String, Object> allData, HttpServletRequest request) {
		String company = (String)allData.get("company");
		String tName = (String)allData.get("tName");
		String comName = company.split("-")[0].trim();
		String comPocus = "";
		Theme theme;
		if(company.split("-").length > 1) {
			// 지점 있을 경우
			comPocus = company.split("-")[1].trim();
			theme = searchService.getThemeByCompanyAndTName(comName, comPocus, tName);
		} else {
			// 지점 없을 경우
			theme = searchService.getThemeByCompanyAndTName(comName, tName);
		}
		
		request.setAttribute("company", company);
		request.setAttribute("theme", theme);

		return "search/themeAjax";
	}

}
