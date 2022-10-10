package com.escape.exiter.user.service;

import java.util.List;
import org.springframework.stereotype.Service;


import com.escape.exiter.user.domain.User;

public interface UserService {
	void addUser(User user);
	User getUserByUserId(String userId);
	long getUserCountByUserId(String userId);
	User getUserByUid(long uid);
	long checkUser(String userId, String uPasswd);
	boolean isValidUser(String userId, String uPasswd);
	String getUserIdByUNameAndUPhone(String uName, String uPhone);
	long checkUserForFindPw(String userId, String uName, String uPhone);
	void changePasswd(String userId, String uPasswd);
	String getUPasswdByUserId(String userId);
	void updateUserInfo(User user);
}
