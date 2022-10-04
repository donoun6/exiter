package com.escape.exiter.company.controller;

import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.company.service.CompanyService;

@Controller
@RequestMapping("/company/company_theme")
public class CompanyThemeController {
	@Autowired
	CompanyService companyService;
	HttpSession session;
	
	@GetMapping
	public String companyThemeForm(Model model, HttpServletRequest request) {
		model.addAttribute("company", new CompanyThemeCommand());
		session = request.getSession(false);
		long cid = (long) session.getAttribute("cid");
		companyService.themeInfo(cid);
		model.addAttribute("companyInfo",companyService.themeInfo(cid));
		return "company/company_theme";
}
	
	@Bean
    public MultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 1024 * 1024 * 10
        return multipartResolver;
    }
	
	@PostMapping
	public String companyTheme(@ModelAttribute("company") CompanyThemeCommand company, Model model,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String PathSpl = request.getSession().getServletContext().getRealPath("/").split(".metadata")[0];
		String addPath = "exiter\\src\\main\\webapp\\resources\\images\\theme\\";
		String path = PathSpl + addPath;
		company.setTImage(file.getOriginalFilename());
		try(
				FileOutputStream fos = new FileOutputStream(path + file.getOriginalFilename());
                InputStream is = file.getInputStream();
        ){
        	    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = is.read(buffer)) != -1){
                fos.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
		
		companyService.addTheme(company);
		
		for (int i = 0; i < company.getTNum(); i++) {
			int tPrice = Integer.parseInt(request.getParameter("tPrice"+(i+1)));
			Long tid = companyService.getTid(company.getTName());
			companyService.addThemePrice(tid, i+1 ,tPrice);
		}
		
		int j = Integer.parseInt(request.getParameter("trNum"));
		for (int i = 0; i < j; i++) {
			String trTime = request.getParameter("trTime"+(i+1));
			Long tid = companyService.getTid(company.getTName());
			companyService.addThemeReservationTime(tid, trTime);
		}
		
		return "redirect:/company/company_theme";
	}
}