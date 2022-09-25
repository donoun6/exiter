package com.escape.exiter.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class CompanyTheme {
	private long tid;
	private long cid;
	private String tName;
	private String tCategory;
	private int tLevel;
	private int tNum;
	private int tPrice;
	private String tDef;
	private int tTime;
	private String tImage;
	private Date regDate;
	
//	생성자
	public CompanyTheme() {
	}
	
}
