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
			map.put("tCategory", stc.getTCategory());
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
			map.put("tCategory", stc.getTCategory());
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
	public List<Map<Object, Object>> getThemeListByCity(String city, String genre) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city, genre);
		
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
			map.put("tCategory", stc.getTCategory());
			themeList.add(map);
		}
		
		return themeList;
	}

	@Override
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String genre) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2, genre);
		
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
			map.put("tCategory", stc.getTCategory());
			themeList.add(map);
		}
		
		return themeList;
	}

	@Override
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String genre) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2, city3, genre);
		
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
			map.put("tCategory", stc.getTCategory());
			themeList.add(map);
		}
		
		return themeList;
	}

	@Override
	public List<Map<Object, Object>> getThemeListByCity(String city1, String city2, String city3, String city4, String genre) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCity(city1, city2, city3, city4, genre);
		
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
			map.put("tCategory", stc.getTCategory());
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
		
		if(loca1.equals("서울")) {
			List<String> countys = new ArrayList<String>();
			if(loca2.equals("전체") || loca2.equals("기타")) {
				themeList = getThemeListByCountyAndGenre(loca1, genre);
				// loca2가 기타라면
				if(loca2.equals("기타")) {
					countys = Arrays.asList("역삼동", "서초동", "반포동", "논현동", "신사동", "서교동", "동교동", "상수동", "창천동", "성수동2가", "자양동", "화양동", "명륜4가", "명륜2가", "동숭동", "동선동1가", "상계동", "수유동", "신림동", "봉천동", "구로동");
					themeList = getLocaEtcList(themeList, countys, genre);
				}
				// loca2가 전체, 장르가 기타라면
				if(loca2.equals("전체") && genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
				return themeList;
			}else if(loca2.equals("강남")) {
				countys = Arrays.asList("역삼동", "서초동", "반포동", "논현동", "신사동");
			} else if(loca2.equals("홍대")) {
				countys = Arrays.asList("서교동", "동교동", "상수동");
			} else if(loca2.equals("신촌")) {
				countys = Arrays.asList("창천동");
			} else if(loca2.equals("건대")) {
				countys = Arrays.asList("성수동2가", "자양동", "화양동");
			} else if(loca2.equals("대학로")) {
				countys = Arrays.asList("명륜4가", "명륜2가", "동숭동", "동선동1가");
			} else if(loca2.equals("강북")) {
				countys = Arrays.asList("상계동", "수유동");
			} else if(loca2.equals("신림")) {
				countys = Arrays.asList("신림동", "봉천동", "구로동");
			}
			
			// 리스트 비었으면
			if(themeList.size() == 0) {
				for(int i = 0; i < countys.size(); i++) {
					List<Map<Object, Object>> list = new ArrayList<>();
					list = getThemeListByCountyAndGenre(loca1, countys.get(i), genre);
					for(int j = 0; j < list.size(); j++) {
						themeList.add(list.get(j));
					}
				}
				// 장르가 기타라면
				if(genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
			}
		} else if(loca1.equals("인천/경기")) {
			List<String> countys = new ArrayList<String>();
			if(loca2.equals("전체") || loca2.equals("기타")) {
				themeList = getThemeListByCity("인천", "경기", genre);
				// loca2가 기타라면
				if(loca2.equals("기타")) {
					countys = Arrays.asList("인천", "경기 부천시", "경기 고양시", "경기 수원시", "경기 안양시");
					themeList = getLocaEtcList(themeList, countys, genre);
				}
				// loca2가 전체, 장르가 기타라면
				if(loca2.equals("전체") && genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
				return themeList;
			} else if(loca2.equals("일산")) {
				loca2 = "경기 고양시";
			} else if(!loca2.equals("인천")) {
				loca2 = "경기 " + loca2 + "시";
			}
			
		} else if(loca1.equals("대전/충청")) {
			List<String> countys = new ArrayList<String>();
			if(loca2.equals("전체") || loca2.equals("기타")) {
				themeList = getThemeListByCity("대전", "충북", "충남", genre);
				// loca2가 기타라면
				if(loca2.equals("기타")) {
					countys = Arrays.asList("대전", "충북 청주시", "충남 천안시");
					themeList = getLocaEtcList(themeList, countys, genre);
				}
				// loca2가 전체, 장르가 기타라면
				if(loca2.equals("전체") && genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
				return themeList;
			} else if(loca2.equals("청주")) {
				loca2 = "충북 청주시";
			} else if(loca2.equals("천안")) {
				loca2 = "충남 천안시";
			}
			
		} else if(loca1.equals("대구/부산/경상")) {
			List<String> countys = new ArrayList<String>();
			if(loca2.equals("전체") || loca2.equals("기타")) {
				themeList = getThemeListByCity("대구", "부산", "경북", "경남", genre);
				// loca2가 기타라면
				if(loca2.equals("기타")) {
					countys = Arrays.asList("대구", "부산");
					themeList = getLocaEtcList(themeList, countys, genre);
				}
				// loca2가 전체, 장르가 기타라면
				if(loca2.equals("전체") && genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
				return themeList;
			}
		} else if(loca1.equals("광주/전주/전라")) {
			List<String> countys = new ArrayList<String>();
			if(loca2.equals("전체") || loca2.equals("기타")) {
				themeList = getThemeListByCity("광주", "전북", "전남", genre);
				// loca2가 기타라면
				if(loca2.equals("기타")) {
					countys = Arrays.asList("광주", "전북 전주시");
					themeList = getLocaEtcList(themeList, countys, genre);
				}
				// loca2가 전체, 장르가 기타라면
				if(loca2.equals("전체") && genre.equals("기타")) {
					themeList = getGenreEtcList(themeList);
				}
				return themeList;
			} else if(loca2.equals("전주")) {
				loca2 = "전북 전주시";
			}
			
		} else if(loca1.equals("강원")) {
			themeList = getThemeListByCity("강원", genre);
			// 장르가 기타라면
			if(genre.equals("기타")) {
				themeList = getGenreEtcList(themeList);
			}
			return themeList;
		}
		
		// 리스트 비었으면
		if(themeList.size() == 0) {
			themeList = getThemeListByCountyAndGenre(loca2, genre);
			// 장르가 기타라면
			if(genre.equals("기타")) {
				themeList = getGenreEtcList(themeList);
			}
		}
		
		return themeList;
	}

	@Override
	public List<Map<Object, Object>> getThemeListByCountyAndGenre(String city, String tCategory) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCountyAndGenre(city, tCategory);
		
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
			map.put("tCategory", stc.getTCategory());
			themeList.add(map);
		}
		
		return themeList;
	}

	@Override
	public List<Map<Object, Object>> getThemeListByCountyAndGenre(String city1, String city2, String tCategory) {
		// DB에서 정보 가져오기
		List<SearchThemeCom> themes = searchDao.findThemeListByCountyAndGenre(city1, city2, tCategory);
		
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
			map.put("tCategory", stc.getTCategory());
			themeList.add(map);
		}
		
		return themeList;
	}

	/**
	 * 세부지역 기타의 테마리스트 조회
	 * @param themeList
	 * @param countys
	 * @param genre
	 * @return
	 */
	@Override
	public List<Map<Object, Object>> getLocaEtcList(List<Map<Object, Object>> themeList, List<String> countys, String genre) {
		List<Map<Object, Object>> list = new ArrayList<>();
		for(int i = 0; i < countys.size(); i++) {
			if(countys.get(0).equals("역삼동")) {
				list = getThemeListByCountyAndGenre("서울", countys.get(i), genre);
			} else {
				list = getThemeListByCountyAndGenre(countys.get(i), genre);
			}
			for(int j = 0; j < list.size(); j++) {
				for(int k = 0; k < themeList.size(); k++) {
					if(themeList.get(k).containsValue(list.get(j).get("tName"))) {
						themeList.remove(k);
						break;
					}
				}
			}
		}
		// 장르가 기타라면
		if(genre.equals("기타")) {
			themeList = getGenreEtcList(themeList);
		}
		return themeList;
	}

	/**
	 * 기타 장르의 테마리스트 조회
	 * @param themeList
	 * @return
	 */
	@Override
	public List<Map<Object, Object>> getGenreEtcList(List<Map<Object, Object>> themeList) {
		List<String> genreList = Arrays.asList("공포", "스릴러", "판타지", "탈옥", "미스터리", "추리", "잠입", "액션");
		
		for(int i = 0; i < themeList.size(); i++) {
			for(int j = 0; j < genreList.size(); j++) {
				if(themeList.get(i).containsValue(genreList.get(j))) {
					themeList.remove(i);
					i--;
					break;
				}
			}
		}
		return themeList;
	}

}
