package com.escape.exiter.company.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.escape.exiter.company.dao.CompanyDao;
import com.escape.exiter.company.domain.Company;
import com.escape.exiter.user.dao.UserDao;

public class CompanyServiceImpl implements CompanyService{
	CompanyDao companyDao = null;
	
//	@Autowired
//	UserDao userDao;

	@Override
	public void addUser(Company company) {
		companyDao.addUser(company);
	}

}
