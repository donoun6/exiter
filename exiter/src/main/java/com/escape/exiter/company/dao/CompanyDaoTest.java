package com.escape.exiter.company.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.company.domain.CompanyUserCommand;
import com.escape.exiter.config.DataSourceConfig;

public class CompanyDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		CompanyDao dao = context.getBean("companyDao", CompanyDao.class);
		CompanyUserCommand company = new CompanyUserCommand();
		
//	company add user test
//		company.setComId("testId");
//		company.setComPasswd("testPw");
//		company.setComTel1("053-793-5686");
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
//		
//	company checkUser
		dao.checkUser("donoun23");
		context.close();
	}
}
