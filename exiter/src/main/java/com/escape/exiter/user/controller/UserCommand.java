package com.escape.exiter.user.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UserCommand {
	private String userId;
	private String uPasswd1;
	private String uPasswd2;
	private String uName;
	private String uPhone;
	
	public UserCommand() {
		
	}
}
