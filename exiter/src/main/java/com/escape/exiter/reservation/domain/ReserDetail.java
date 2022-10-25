package com.escape.exiter.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReserDetail {
	private long rid;
	private long uid;
	private long tid;
	private long cid;
	private String rPrice;
	private String rDate;
	private String rTime;
	private int rNum;
	private String tName;
	private String tCategory;
	private int tLevel;
	private int tTime;
	private String tImage;
	private String comAddress2;
	private String comAddress4;
	private String comName;
	private String comPocus;
	private String comTel;
	
	public ReserDetail() {
		
	}
}
