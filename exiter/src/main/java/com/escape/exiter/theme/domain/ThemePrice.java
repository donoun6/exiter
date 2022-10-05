package com.escape.exiter.theme.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ThemePrice {
	private long tpid;
	private long tid;
	private int tpNum;
	private int tPrice;
	
	public ThemePrice() {
		
	}
}
