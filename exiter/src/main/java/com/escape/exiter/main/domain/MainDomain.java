package com.escape.exiter.main.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class MainDomain {
	private String tImage;
	private String tName;
	private String comName;
	private String comPocus;
	private String tCategory;

	public MainDomain() {
	}
}
