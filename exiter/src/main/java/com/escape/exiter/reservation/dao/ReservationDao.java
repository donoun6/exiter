package com.escape.exiter.reservation.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.reservation.domain.ReservationDomain;

@Repository
public class ReservationDao {
	private JdbcTemplate jdbcTemplate;
	
	public ReservationDao(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public void addReservation(ReservationDomain reservation) {
		String sql = "INSERT INTO Reservation(uid, tid, rPrice, rDate, rTime, rNum)"
				+ "VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, reservation.getUid(),reservation.getTid(),
				reservation.getRPrice(),reservation.getRDate(),
				reservation.getRTime(),reservation.getRNum());
		System.out.println("[예약 등록]\n" + reservation.toString() + "\n");
	}
}
