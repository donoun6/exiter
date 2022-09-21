package com.escape.exiter.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Company {
	private long cid;
	private String comId;
	private String comPasswd;
	private String comTel;
	private String comAddress1;
	private String comAddress2;
	private String comAddress3;
	private String comAddress4;
	private String comNum;
	private String comName;
	private String comPocus;
	private Date regDate;
	
//	생성자
	public Company() {}
}
