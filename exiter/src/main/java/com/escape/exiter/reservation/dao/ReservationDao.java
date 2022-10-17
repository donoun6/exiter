package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	/**
	 * uid로 예약내역 카운트 가져오기
	 * @param uid
	 * @return
	 */
	public long findCntReserByUid(long uid) {
		String sql = "SELECT Count(*) as cnt FROM Reservation WHERE uid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<Long>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
			
		}, uid);
	}
	/*
	public List<ReservationDomain> findReservationByUid(long uid) {
		String sql = "SELECT * FROM Reservation WHERE uid = ?";

	}
	*/
}
