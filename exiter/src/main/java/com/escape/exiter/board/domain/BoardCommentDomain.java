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
public class BoardCommentDomain {
	private long bcid;
	private long uid;
	private long bid;
	private String bcDef;
	private Date regDate;
	
	public BoardCommentDomain() {
	}
}
