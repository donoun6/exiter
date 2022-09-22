package com.escape.exiter.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.company.dao.CompanyDao;
import com.escape.exiter.company.domain.CompanyUserCommand;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyDao companyDao;

	@Override
	public void addUser(CompanyUserCommand company) {
		companyDao.addUser(company);
	}

}
