package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.reservation.domain.ReservationCom;

public class ReservationRowMapper implements RowMapper<ReservationCom> {
	
	@Override
	public ReservationCom mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationCom reser = new ReservationCom();
		
		
		
		return reser;
	}

}
