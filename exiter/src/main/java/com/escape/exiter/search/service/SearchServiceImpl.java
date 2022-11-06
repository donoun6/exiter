package com.escape.exiter.search.service;

import java.util.ArrayList;
import java.util.Arrays;
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
	public List<Map<Object, Object>> getThemeList() {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeList();
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

	@Override
	public List<Map<Object, Object>> getThemeListByCity(String city) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city);
		
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
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2);
		
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
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2, city3);
		
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
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String city4) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2, city3, city4);
		
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
	
	/**
	 * 세부지역 및 장르로 테마 검색
	 * @param loca1
	 * @param loca2
	 * @param genre
	 * @return
	 */
	@Override
	public List<Map<Object, Object>> getThemeListByCounty(String loca1, String loca2, String genre) {
		List<Map<Object, Object>> themeList = new ArrayList<Map<Object, Object>>();
		
		/*
		 * 서비스1 : 지역2, 장르
		 * 서비스2 : 지역1, 지역2, 장르
		 * 장르포함 rowMapper
		 */
		if(loca1.equals("서울")) {
			if(loca2.equals("전체")) {
				themeList = getThemeListByCity(loca1);
			}else if(loca2.equals("강남")) {
				String[] arr = {"역삼동", "서초동", "반포동", "논현동", "신사동"};
			} else if(loca2.equals("홍대")) {
				String[] arr = {"서교동", "동교동", "상수동"};
			} else if(loca2.equals("신촌")) {
				String[] arr = {"창천동"};
			} else if(loca2.equals("건대")) {
				String[] arr = {"성수동2가", "자양동", "화양동"};
			} else if(loca2.equals("대학로")) {
				String[] arr = {"명륜4가", "명륜2가", "동숭동", "동선동1가"};
			} else if(loca2.equals("강북")) {
				String[] arr = {"상계동", "수유동"};
			} else if(loca2.equals("신림")) {
				String[] arr = {"신림동", "봉천동", "구로동"};
			} else if(loca2.equals("기타")) {
				// 기타
			}
		} else if(loca1.equals("인천/경기")) {
			if(loca2.equals("전체")) {
				themeList = getThemeListByCity("인천", "경기");
			} else if(loca2.equals("일산")) {
				loca2 = "경기 고양시";
			} else if(loca2.equals("기타")) {
				// 기타
			} else if(!loca2.equals("인천")) {
				loca2 = "경기 " + loca2 + "시";
			}
			
			if(themeList.size() == 0) {
				themeList = getThemeListByCity(loca2);
			}
		} else if(loca1.equals("대전/충청")) {
			if(loca2.equals("전체")) {
				themeList = getThemeListByCity("대전", "충북", "충남");
			} else if(loca2.equals("청주")) {
				loca2 = "충북 청주시";
			} else if(loca2.equals("천안")) {
				loca2 = "충남 천안시";
			} else if(loca2.equals("기타")) {
				// 기타
			}
			
			if(themeList.size() == 0) {
				themeList = getThemeListByCity(loca2);
			}
		} else if(loca1.equals("대구/부산/경상")) {
			if(loca2.equals("전체")) {
				themeList = getThemeListByCity("대구", "부산", "경북", "경남");
			} else if(loca2.equals("기타")) {
				// 기타
			} else {
				themeList = getThemeListByCity(loca2);
			}
		} else if(loca1.equals("광주/전주/전라")) {
			if(loca2.equals("전체")) {
				themeList = getThemeListByCity("광주", "전북", "전남");
			} else if(loca2.equals("전주")) {
				loca2 = "전북 전주시";
			} else if(loca2.equals("기타")) {
				// 기타
			}
			
			if(themeList.size() == 0) {
				themeList = getThemeListByCity(loca2);
			}
		}
		
		// 장르 비교(->dao에서)
		
		return themeList;
	}

}
