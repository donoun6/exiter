package com.escape.exiter.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.company.dao.CompanyDao;
import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyTheme;
import com.escape.exiter.company.domain.CompanyThemeCommand;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyDao companyDao;

//	Company SignUp Dao
	@Override
	public void addUser(CompanyCommand company) {
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

	@Override
	public Company companyInfo(String comId) {
		return companyDao.companyInfo(comId);
	}

//	Company Theme Dao
	@Override
	public void addTheme(CompanyThemeCommand companyTheme) {
		companyDao.addTheme(companyTheme);
	}

	@Override
	public List<CompanyTheme> themeInfo(long cid) {
		return companyDao.themeInfo(cid);
	}

}
