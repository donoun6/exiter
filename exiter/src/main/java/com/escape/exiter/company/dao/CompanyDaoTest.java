package com.escape.exiter.company.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.company.domain.CompanySignUpCommand;
import com.escape.exiter.config.DataSourceConfig;

public class CompanyDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		CompanyDao dao = context.getBean("companyDao", CompanyDao.class);
		CompanySignUpCommand company = new CompanySignUpCommand();
		
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
		dao.login("testId", "testPw1");
		context.close();
	}
}
