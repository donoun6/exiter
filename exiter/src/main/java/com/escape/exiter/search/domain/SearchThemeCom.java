package com.escape.exiter.search.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SearchThemeCom {
	private String comName; // 매장명 - 지점명
	private String tName;
	private String tImage;
	
	public SearchThemeCom() {
		
	}
}
