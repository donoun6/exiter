package com.escape.exiter.search.service;

import java.util.List;
import java.util.Map;

import com.escape.exiter.theme.domain.Theme;

public interface SearchService {
	List<Map<Object, Object>> getThemeList();
	List<Map<Object, Object>> getThemeList(String tName);
	Theme getThemeByCompanyAndTName(String comName, String comPocus, String tName);
	Theme getThemeByCompanyAndTName(String comName, String tName);
	List<Map<Object, Object>> getThemeListByCity(String city, String genre);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String genre);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String genre);
	List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String city4, String genre);
	List<Map<Object, Object>> getThemeListByCounty(String loca1, String loca2, String genre);
	List<Map<Object, Object>> getThemeListByCountyAndGenre(String city, String tCategory);
	List<Map<Object, Object>> getThemeListByCountyAndGenre(String city1, String city2, String tCategory);
	List<Map<Object, Object>> getLocaEtcList(List<Map<Object, Object>> themeList, List<String> countys, String genre);
	List<Map<Object, Object>> getGenreEtcList(List<Map<Object, Object>> themeList, List<String> genreList);
}
