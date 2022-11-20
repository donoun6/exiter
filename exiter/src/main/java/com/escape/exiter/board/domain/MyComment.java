package com.escape.exiter.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MyComment {
	private long bcid;
	private long uid;
	private long bid;
	private long cid;
	private String bcDef;
	private Date regDate;
	private String bTitle;
	private String bCategory;
	private int bcCnt;
	private String bTime;
	
	public MyComment() {
		
	}
}
