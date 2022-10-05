package com.escape.exiter.theme.service;

import java.util.List;
import java.util.Map;

import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.domain.ThemePrice;

public interface ThemeService {
	Theme getThemeByTid(long tid);
	List<ThemePrice> getThemePriceByTid(long tid);
	long getTpCntByTid(long tid);
	int getTPriceByTidAndTNum(long tid, int tpNum);
}
