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
public class BoardCommand {
	private long bid;
	private String bTitle;
	private String bDef;
	private String bCategory;
	private Date regDate;
	private long uid;
	private String userId;
	private String uPasswd;
	private String uName;
	private String uPhone;
	private String uGrade;
	private char uType;
	private boolean uCheck;
	
	public BoardCommand() {
		
	}
}
