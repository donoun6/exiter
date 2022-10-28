package com.escape.exiter.reservation.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ReservationDomain {
	private long rid;
	private long uid;
	private long cid;
	private long tid;
	private int rPrice;
	private String rDate;
	private String rTime;
	private int rNum;
	private Date regDate;
	public ReservationDomain() {
	}
}
