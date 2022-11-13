package com.escape.exiter.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class BoardDomain {
	private long bid;
	private long cid;
	private String bTtitle;
	private String bDef;
	private String bCategory;
	private Date regDate;
	
	public BoardDomain() {
		
	}
}
