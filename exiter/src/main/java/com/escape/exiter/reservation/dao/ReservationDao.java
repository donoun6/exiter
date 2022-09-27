package com.escape.exiter.reservation.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.reservation.domain.ReservationCom;

@Repository
public class ReservationDao {
	private JdbcTemplate jdbcTemplate;
	
	public ReservationDao(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public List<ReservationCom> findReservationListByTime(String Time) {
		String sql = "SELECT ";
		return jdbcTemplate.query(sql, new ReservationRowMapper());
	}
	
}
