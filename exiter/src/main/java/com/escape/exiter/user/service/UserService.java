package com.escape.exiter.user.service;

import org.springframework.stereotype.Service;

import com.escape.exiter.user.domain.User;

public interface UserService {
	void addUser(User user);
	User getUserByUserId(String userId);
	long getUserCountByUserId(String userId);
	User getUserByUid(long uid);
	boolean isValidUser(String userId, String uPasswd);
}
