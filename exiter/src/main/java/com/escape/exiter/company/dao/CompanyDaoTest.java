package com.escape.exiter.company.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.company.domain.Company;
import com.escape.exiter.config.DataSourceConfig;

public class CompanyDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		CompanyDao dao = context.getBean("companyDao", CompanyDao.class);
		Company company = new Company();
		
//	company add user test
		company.setComId("testId");
		company.setComPasswd("testPw");
		company.setComTel("053-793-5686");
		company.setComAddress1("testaddr");
		company.setComAddress2("testaddr");
		company.setComAddress3("testaddr");
		company.setComAddress4("testaddr");
		company.setComNum("0000000000");
		company.setComName("대구점");
		company.setComPocus("반월당");
		dao.addUser(company);
		
//	tset
		
		context.close();
	}
}
