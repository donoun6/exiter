package com.escape.exiter.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class CompanyCommand {
	private String comId;
	private String comPasswd;
	private String comTel1;
	private String comTel2;
	private String comTel3;
	private String comAddress1;
	private String comAddress2;
	private String comAddress3;
	private String comAddress4;
	private String comNum;
	private String comName;
	private String comPocus;
	
//	생성자
	public CompanyCommand() {
	}
}
