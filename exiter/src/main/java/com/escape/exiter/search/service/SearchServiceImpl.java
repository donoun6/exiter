package com.escape.exiter.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.search.dao.SearchDao;
import com.escape.exiter.search.domain.SearchThemeCom;
import com.escape.exiter.theme.domain.Theme;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	SearchDao searchDao;

	@Override
	public List<Map<Object, Object>> getThemeList(String tName) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByTName(tName);
		// 반환할 List
		List<Map<Object, Object>> themeList = new ArrayList<Map<Object, Object>>();
		
		// themeList에 새로 담기
		for (SearchThemeCom stc : themes) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			if(stc.getComPocus().equals("")) {
				// 지점명이 없다면
				map.put("comName", stc.getComName());
			} else {
				// 있다면
				map.put("comName", stc.getComName() + " - " + stc.getComPocus());
			}
			map.put("tName", stc.getTName());
			map.put("tImage", stc.getTImage());
			themeList.add(map);
		}
		
		return themeList;
	}
	
	@Override
	public Theme getThemeByCompanyAndTName(String comName, String comPocus, String tName) {
		return searchDao.findThemeByCompanyAndTName(comName, comPocus, tName);
	}

	@Override
	public Theme getThemeByCompanyAndTName(String comName, String tName) {
		return searchDao.findThemeByCompanyAndTName(comName, tName);
	}
}
