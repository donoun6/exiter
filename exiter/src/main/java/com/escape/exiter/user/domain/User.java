package com.escape.exiter.user.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class User {
	private long uid;
	private String userId;
	private String uPasswd;
	private String uName;
	private String uPhone;
	private String uGrade;
	private char uType;
	private boolean uCheck;
	private Date regDate;
	
	public User() {
		
	}
}
