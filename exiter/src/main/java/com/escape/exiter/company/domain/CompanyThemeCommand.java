package com.escape.exiter.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class CompanyThemeCommand {
	private long cid;
	private long tid;
	private String tName;
	private String tCategory;
	private int tLevel;
	private int tNum;
	private String tDef;
	private int tTime;
	private String tImage;
	
//	생성자
	public CompanyThemeCommand() {
	}
	
}
