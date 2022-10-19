package com.escape.exiter.theme.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.service.CompanyService;
import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.domain.ThemePrice;
import com.escape.exiter.theme.service.ThemeService;

@Controller
public class ThemeController {
	
	@Autowired
	ThemeService themeService;
	
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/theme/theme/{tid}")
	public String themeDetailPage(@PathVariable("tid") long tid, Model model) {
		Theme theme = themeService.getThemeByTid(tid);
		long cnt = themeService.getTpCntByTid(tid);
		
		
		List<ThemePrice> tpList = themeService.getThemePriceByTid(tid);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String tPrice = decFormat.format(tpList.get(0).getTPrice());
		
		Company company = companyService.companyInfo(theme.getCid());
		
		model.addAttribute("theme", theme);
		model.addAttribute("cnt", cnt);
		model.addAttribute("tPrice", tPrice);
		model.addAttribute("company", company);
		return "theme/theme";
	}
	
	@RequestMapping(value="/theme/theme/checkTPrice", method=RequestMethod.POST)
	@ResponseBody
	public String tPriceCheck(@RequestBody Map<String, Object> allData) {
		long tid = (int)allData.get("tid");
		int tpNum = (int)allData.get("index2");
		long tp = themeService.getTPriceByTidAndTNum(tid, tpNum+1);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String tPrice = decFormat.format(tp);
		
		return tPrice;
	}
}
