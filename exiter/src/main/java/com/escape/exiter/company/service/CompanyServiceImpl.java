package com.escape.exiter.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.company.dao.CompanyDao;
import com.escape.exiter.company.domain.CompanySignUpCommand;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyDao companyDao;

//	Company SignUp Dao
	@Override
	public void addUser(CompanySignUpCommand company) {
		companyDao.addUser(company);
	}

	@Override
	public boolean checkUser(String comId) {
		return companyDao.checkUser(comId);
	}

	@Override
	public boolean checkComNum(String comNum) {
		return companyDao.checkComNum(comNum);
	}

//	Company Login Dao
	@Override
	public boolean login(String comId, String comPasswd) {
		return companyDao.login(comId, comPasswd);
	}

}
