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
		model.addAttribute("getCategory",mainService.getCategory());
		
		List<List<MainDomain>> list = new ArrayList<List<MainDomain>>();
		for(int i = 0; i < mainService.getCategory().size(); i++) {
			String category = mainService.getCategory().get(i).getTCategory();
			list.add(mainService.CategoryImg(category));
		}
		
		model.addAttribute("cateImg",list);
		return "index";
	}
	
}