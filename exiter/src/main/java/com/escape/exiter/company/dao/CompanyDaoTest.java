package com.escape.exiter.company.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.company.domain.CompanyCommand;
import com.escape.exiter.company.domain.CompanyTheme;
import com.escape.exiter.company.domain.CompanyThemeCommand;
import com.escape.exiter.config.DataSourceConfig;

public class CompanyDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		CompanyDao dao = context.getBean("companyDao", CompanyDao.class);
		CompanyCommand company = new CompanyCommand();
		CompanyThemeCommand companyTheme = new CompanyThemeCommand();
		CompanyTheme companyTheme2 = new CompanyTheme();
		
		
//	company add user test
//		company.setComId("testId");
//		company.setComPasswd("testPw");
//		company.setComTel1("053");
//		company.setComTel2("793");
//		company.setComTel3("5686");
//		company.setComAddress1("testaddr");
//		company.setComAddress2("testaddr");
//		company.setComAddress3("testaddr");
//		company.setComAddress4("testaddr");
//		company.setComNum("0000000000");
//		company.setComName("대구점");
//		company.setComPocus("반월당");
//		dao.addUser(company);
		
//	company checkUser test
//		dao.checkUser("testId");
		
//	company checkComNum test
//		dao.checkComNum("0000000000");
		
//	company login test
//		dao.login("testId", "testPw");
		
//		company companyInfo test
//		dao.companyInfo("testId");
		

//	company add theme test
//		companyTheme.setCid(1);
//		companyTheme.setTName("테스트이름");
//		companyTheme.setTCategory("테스트카테고리");
//		companyTheme.setTLevel(1);
//		companyTheme.setTNum(1);
//		companyTheme.setTTime(60);
//		companyTheme.setTDef("테스트설명");
//		companyTheme.setTImage("테스트이미지");
//		dao.addTheme(companyTheme);
		
//	company theme getTid test	
//		dao.getTid("테스트이름");
		
//	company theme price test
//		long tid = 1;
//		dao.addThemePrice(tid, 6000);
		
//	company theme price test
//		long tid = 1;
//		dao.addThemeReservationTime(tid, "AM 06:00");

//	company delete test
//		long tid = 7;
//		dao.deleteTheme(tid);
		
//	company theme info test
//		dao.themeInfo(2);
		
//	company change company info test
//		company.setComId("earth1");
//		company.setComPasswd("testPw");
//		company.setComTel1("053");
//		company.setComTel2("793");
//		company.setComTel3("5686");
//		company.setComAddress1("testaddr");
//		company.setComAddress2("testaddr");
//		company.setComAddress3("testaddr");
//		company.setComAddress4("testaddr");
//		company.setComName("대구점");
//		company.setComPocus("반월당");
//		dao.updateCompanyInfo(company);
		
//	companyReservation Test
//		dao.getReservationInfo(1);
//		dao.getReservatioByDate(1, "2022-11-01");
		
//		dao.getReservationThemeInfo(1, "2022-11-01");
//		dao.getReservationInfoByDateAndTid(1, "2022-11-03", 1);
//		System.out.println(dao.getReservationCountByTid(1));
		
//		System.out.println(dao.getReservationMonthCountByCid("2022-12", 1));
//		System.out.println(dao.getReservationDayCountByCid("2022-11-27", 1));
		context.close();
	}
}
