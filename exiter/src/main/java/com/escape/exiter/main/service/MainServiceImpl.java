package com.escape.exiter.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.main.dao.MainDao;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDao mainDao;
	
	@Override
	public String randomImg() {
		return mainDao.randomImg();
	}

	@Override
	public List<Object> newImg() {
		return mainDao.newImg();
	}

}
