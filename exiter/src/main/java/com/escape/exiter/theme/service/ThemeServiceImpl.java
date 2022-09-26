package com.escape.exiter.theme.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.search.domain.SearchThemeCom;
import com.escape.exiter.theme.dao.ThemeDao;

@Service
public class ThemeServiceImpl implements ThemeService {
	
	@Autowired
	ThemeDao themeDao;

}
