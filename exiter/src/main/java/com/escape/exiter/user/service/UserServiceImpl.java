package com.escape.exiter.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.escape.exiter.user.dao.UserDao;
import com.escape.exiter.user.domain.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	@Override
	public User getUserByUserId(String userId) {
		return userDao.findUserByUserId(userId);
	}
	
	@Override
	public long getUserCountByUserId(String userId) {
		return userDao.findUserCountByUserId(userId);
	}

	@Override
	public User getUserByUid(long uid) {
		return userDao.findUserByUid(uid);
	}
	
	@Override
	public long checkUser(String userId, String uPasswd) {
		return userDao.checkUser(userId, uPasswd);
	}

	@Override
	public boolean isValidUser(String userId, String uPasswd) {
		return userDao.isValidUser(userId, uPasswd);
	}

	@Override
	public String getUserIdByUNameAndUPhone(String uName, String uPhone) {
		return userDao.findUserIdByUNameAndUPhone(uName, uPhone);
	}

	@Override
	public long checkUserForFindPw(String userId, String uName, String uPhone) {
		return userDao.checkUserForFindPw(userId, uName, uPhone);
	}

	@Override
	public void changePasswd(String userId, String uPasswd) {
		userDao.changePasswd(userId, uPasswd);
	}

	@Override
	public String getUPasswdByUserId(String userId) {
		return userDao.findUPasswdByUserId(userId);
	}

}
