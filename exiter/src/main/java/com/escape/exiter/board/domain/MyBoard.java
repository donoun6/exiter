package com.escape.exiter.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MyBoard {
	private long bid;
	private long uid;
	private long cid;
	private String bTitle;
	private String bDef;
	private String bCategory;
	private int bcCheck;
	private Date regDate;
	private String userId;
	private String uGrade;
	private int bcCnt;
	private boolean bcUpdate;
	
	public MyBoard() {
		
	}
}
