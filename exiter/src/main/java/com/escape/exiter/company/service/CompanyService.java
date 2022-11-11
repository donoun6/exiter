package com.escape.exiter.company.service;

import java.util.List;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyReservation;
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
	
	public Company companyInfo(long cid);
	
//	Company Theme Dao
	void addTheme(CompanyThemeCommand companyTheme);
	
	Long getTid(String tName);
	
	void addThemePrice(Long tid, int tpNum, int tPrice);
	
	void addThemeReservationTime(Long tid,String trTime);
	
	List<CompanyTheme> themeInfo(long cid);
	
	void deleteThemePrice(Long tid);
	
	void deleteThemeReservationTime(Long tid);
	
	void deleteTheme(Long tid);
	
	void updateCompanyInfo(CompanyCommand company);
	
//	Company Reservation Dao
	List<CompanyReservation> getReservationInfo(long cid);
	
	List<CompanyReservation> getReservationThemeInfo(long cid,String date);
	
	List<CompanyReservation> getReservationInfoByDateAndTid(long cid,String date, long tid);
	
	void deleteReservation(String rid);
	
	long getReservationCountByTid(long tid);
	
	long getReservationMonthCountByCid(String rDate ,long cid);
	
	long getReservationDayCountByCid(String rDate ,long cid);
}
