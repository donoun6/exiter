package com.escape.exiter.theme.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Theme {
	private long tid;
	private String tName;
	private String tCategory;
	private int tLevel;
	private int tNum;
	private int tPrice;
	private String tDef;
	private int tTime;
	private String tImage;
	private long cid;
	private Date regDate;
	
	public Theme() {
		
	}
 }
