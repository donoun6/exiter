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
public class CompanyReservation {
	private long rid;
	private long uid;
	private long cid;
	private long tid;
	private String rPrice;
	private String rDate;
	private String rTime;
	private int rNum;
	private String regDate;
	private String tName;
	private String tCategory;
	private int tLevel;
	private int tNum;
	private String tDef;
	private int tTime;
	private String tImage;
	private String userId;
	private String uName;
	private String uPhone;
	private char uType; 
	public CompanyReservation() {
	}

}
