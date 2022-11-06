package com.escape.exiter.search.service;

import java.util.List;
import java.util.Map;

import com.escape.exiter.theme.domain.Theme;

public interface SearchService {
	List<Map<Object, Object>> getThemeList();
	List<Map<Object, Object>> getThemeList(String tName);
	Theme getThemeByCompanyAndTName(String comName, String comPocus, String tName);
	Theme getThemeByCompanyAndTName(String comName, String tName);
	List<Map<Object, Object>> getThemeListByCity(String city);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String city4);
	List<Map<Object, Object>> getThemeListByCounty(String loca1, String loca2, String genre);
}
