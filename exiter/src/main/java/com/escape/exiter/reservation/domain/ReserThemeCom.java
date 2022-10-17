package com.escape.exiter.reservation.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReserThemeCom {
	private long rid;
	private long uid;
	private long tid;
	private String rPrice;
	private String rDate;
	private String rTime;
	private int rNum;
	private String tName;
	private String tCategory;
	private int tLevel;
	private String tImage;
	private long cid;
	private String comName;
	private String comPocus;
	private Date regDate;
	public ReserThemeCom() {
		
	}
}
