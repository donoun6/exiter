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
	private Integer tLevel;
	private Integer tNum;
	private String tDef;
	private Integer tTime;
	private String tImage;
	
//	생성자
	public CompanyThemeCommand() {
	}
	
}
