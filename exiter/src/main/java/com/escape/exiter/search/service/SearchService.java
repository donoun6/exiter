package com.escape.exiter.search.service;

import java.util.List;
import java.util.Map;

import com.escape.exiter.theme.domain.Theme;

public interface SearchService {
	List<Map<Object, Object>> getThemeList(String tName);
	Theme getThemeByCompanyAndTName(String comName, String comPocus, String tName);
	Theme getThemeByCompanyAndTName(String comName, String tName);
}
