package com.escape.exiter.theme.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ThemeReservationTime {
	private long trid;
	private long tid;
	private String trTime;
	
	public ThemeReservationTime() {
		
	}
}
