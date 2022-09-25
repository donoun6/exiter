package com.escape.exiter.company.service;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanySignUpCommand;

public interface CompanyService {
	
//	Company SignUp Dao
	void addUser(CompanySignUpCommand company);
	
	boolean checkUser(String comId);
	
	boolean checkComNum(String comNum);

//	Company Login Dao
	boolean login(String comId,String comPasswd);
}
