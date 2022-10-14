package com.escape.exiter.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escape.exiter.main.domain.MainDomain;
import com.escape.exiter.main.service.MainService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService mainService;	//Service Bean
	
	/** main 페이지 출력
	 * @param model 값을 넘겨주기위해 사용
	 */
	@GetMapping
	public String mainPage(Model model) {
		model.addAttribute("randomImg",mainService.randomImg());
		model.addAttribute("newImg",mainService.newImg());
		List <MainDomain> getCategory = mainService.getCategory();
		model.addAttribute("getCategory", getCategory);
		
		List<List<MainDomain>> list = new ArrayList<List<MainDomain>>(); //아래 category를 이용하여 category별 img를 이중List에 담는다.
		for(int i = 0; i < getCategory.size(); i++) {
			String category = getCategory.get(i).getTCategory();
			list.add(mainService.CategoryImg(category));
		}
		
		model.addAttribute("cateImg",list);
		return "index";
	}
	
}