package com.escape.exiter.company.service;

import java.util.List;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyTheme;
import com.escape.exiter.company.domain.CompanyThemeCommand;

public interface CompanyService {
	
//	Company SignUp Dao
	void addUser(CompanyCommand company);
	
	boolean checkUser(String comId);
	
	boolean checkComNum(String comNum);

//	Company Login Dao
	boolean login(String comId,String comPasswd);
	
	Company companyInfo(String comId);
	
//	Company Theme Dao
	void addTheme(CompanyThemeCommand companyTheme);
	
	List<CompanyTheme> themeInfo(long cid);
}
