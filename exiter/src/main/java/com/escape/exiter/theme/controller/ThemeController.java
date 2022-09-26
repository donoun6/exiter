package com.escape.exiter.theme.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.exiter.theme.service.ThemeService;

@Controller
public class ThemeController {
	
	@Autowired
	ThemeService themeService;
	
}
