package com.escape.exiter.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.company.dao.CompanyDao;
import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyReservation;
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
	
	@Override
	public Company companyInfo(long cid) {
		return companyDao.companyInfo(cid);
	}

//	Company Theme Dao
	@Override
	public void addTheme(CompanyThemeCommand companyTheme) {
		companyDao.addTheme(companyTheme);
	}

	@Override
	public Long getTid(String tName) {
		return companyDao.getTid(tName);
	}
	
	@Override
	public void addThemePrice(Long tid, int tpNum , int tPrice) {
		companyDao.addThemePrice(tid, tpNum, tPrice);
	}
	
	@Override
	public void addThemeReservationTime(Long tid, String trTime) {
		companyDao.addThemeReservationTime(tid, trTime);
	}
	
	@Override
	public List<CompanyTheme> themeInfo(long cid) {
		return companyDao.themeInfo(cid);
	}

	@Override
	public void deleteThemePrice(Long tid) {
		companyDao.deleteThemePrice(tid);
	}

	@Override
	public void deleteThemeReservationTime(Long tid) {
		companyDao.deleteThemeReservationTime(tid);
	}

	@Override
	public void deleteTheme(Long tid) {
		companyDao.deleteTheme(tid);
	}

	@Override
	public void updateCompanyInfo(CompanyCommand company) {
		companyDao.updateCompanyInfo(company);
	}

//	Company Reservation Dao
	@Override
	public List<CompanyReservation> getReservationInfo(long cid) {
		return companyDao.getReservationInfo(cid);
	}

}
