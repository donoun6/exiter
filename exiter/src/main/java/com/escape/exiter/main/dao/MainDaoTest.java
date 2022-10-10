package com.escape.exiter.main.dao;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.escape.exiter.config.DataSourceConfig;

public class MainDaoTest {
	
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataSourceConfig.class);
		MainDao dao = context.getBean("mainDao",MainDao.class);
		
//		System.out.println(dao.randomImg());
	}
	
}
