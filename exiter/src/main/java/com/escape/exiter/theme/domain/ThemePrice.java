package com.escape.exiter.theme.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ThemePrice {
	private long tpid;
	private long tid;
	private int tpNum;
	private int tPrice;
	
	public ThemePrice() {
		
	}
}
