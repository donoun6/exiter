package com.escape.exiter.company.service;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyUserCommand;

public interface CompanyService {
	
	void addUser(CompanyUserCommand company);
	
	boolean checkUser(String comId);
	
	boolean checkComNum(String comNum);
}
