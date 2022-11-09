package com.escape.exiter.search.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.escape.exiter.search.service.SearchService;

@Controller
public class SearchLocagenController {

	@Autowired
	SearchService searchService;
	
	/**
	 * 지역/장르 검색
	 * @return
	 */
	@GetMapping("/search/search_locagen")
	public String searchLocagenForm() {
		return "search/search_locagen";
	}
	
	/**
	 * 지역 하위카테고리, 장르 및 리스트 가져오기
	 * @return
	 */
	@PostMapping("/search/checking_loca")
	public String checkingLoca(HttpServletRequest request) {
		String city = request.getParameter("loca1");
		
		List<String> cityList = new ArrayList<String>();
		List<Map<Object, Object>> themeList = new ArrayList<Map<Object, Object>>();
		List<String> genreList = Arrays.asList("공포", "스릴러", "판타지", "탈옥", "미스터리", "추리", "잠입", "액션");
		
		if(city.equals("전국")) {
			themeList = searchService.getThemeList();
		} else if(city.equals("서울")) {
			cityList = Arrays.asList("강남", "홍대", "신촌", "건대", "대학로", "강북", "신림");
			themeList = searchService.getThemeListByCity(city, "전체");
		} else if(city.equals("인천/경기")) {
			cityList = Arrays.asList("인천", "부천", "일산", "수원", "안양");
			themeList = searchService.getThemeListByCity("인천", "경기", "전체");
		} else if(city.equals("대전/충청")) {
			cityList = Arrays.asList("대전", "청주", "천안");
			themeList = searchService.getThemeListByCity("대전", "충북", "충남", "전체");
		} else if(city.equals("대구/부산/경상")) {
			cityList = Arrays.asList("대구", "부산");
			themeList = searchService.getThemeListByCity("대구", "부산", "경북", "경남", "전체");
		} else if(city.equals("광주/전주/전라")) {
			cityList = Arrays.asList("광주", "전주");
			themeList = searchService.getThemeListByCity("광주", "전북", "전남", "전체");
		} else if(city.equals("강원")) {
			themeList = searchService.getThemeListByCity(city, "전체");
		}
		Collections.shuffle(themeList);
		
		request.setAttribute("city", city);
		request.setAttribute("cityList", cityList);
		request.setAttribute("genreList", genreList);
		request.setAttribute("themeList", themeList);
		return "search/search_locagen";
	}
	
	/**
	 * 세부지역 및 장르로 테마리스트 가져오기
	 * @param request
	 * @return
	 */
	@PostMapping("/search/checking_loca2")
	public String checkingLoca2(HttpServletRequest request) {
		String city1 = request.getParameter("loca1");
		String city2 = request.getParameter("loca2");
		String genre = request.getParameter("genre");
		
		List<String> cityList = new ArrayList<String>();
		List<Map<Object, Object>> themeList = new ArrayList<Map<Object, Object>>();
		List<String> genreList = Arrays.asList("공포", "스릴러", "판타지", "탈옥", "미스터리", "추리", "잠입", "액션");
		
		if(city1.equals("서울")) {
			cityList = Arrays.asList("강남", "홍대", "신촌", "건대", "대학로", "강북", "신림");
			
		} else if(city1.equals("인천/경기")) {
			cityList = Arrays.asList("인천", "부천", "일산", "수원", "안양");
			
		} else if(city1.equals("대전/충청")) {
			cityList = Arrays.asList("대전", "청주", "천안");
			
		} else if(city1.equals("대구/부산/경상")) {
			cityList = Arrays.asList("대구", "부산");
			
		} else if(city1.equals("광주/전주/전라")) {
			cityList = Arrays.asList("광주", "전주");
			
		}
		
		
		themeList = searchService.getThemeListByCounty(city1, city2, genre);
		
		request.setAttribute("city", city1);
		request.setAttribute("city2", city2);
		request.setAttribute("genre", genre);
		request.setAttribute("cityList", cityList);
		request.setAttribute("genreList", genreList);
		request.setAttribute("themeList", themeList);
		return "search/search_locagen";
	}
}
