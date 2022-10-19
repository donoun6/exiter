package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.reservation.domain.ReserThemeCom;
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
	
	public List<ReserThemeCom> findReservationsAfterToday(long uid) {
		String sql = "SELECT r.rid, r.uid, r.tid, r.rPrice, r.rDate, r.rTime, r.rNum, t.tName, t.tCategory, t.tLevel, t.tImage, t.cid, c.comName, c.comPocus, r.regDate"
				+ " FROM Reservation r"
				+ " INNER JOIN Theme t ON r.tid = t.tid"
				+ " INNER JOIN Company c ON t.cid = c.cid"
				+ " WHERE uid = ? AND"
				+ " rDate > CURRENT_DATE()"
				+ " ORDER BY rDate";
		return jdbcTemplate.query(sql, new ReserThemeComRowMapper(), uid);
	}
	
	public List<ReserThemeCom> findReservationsBeforeToday(long uid) {
		String sql = "SELECT r.rid, r.uid, r.tid, r.rPrice, r.rDate, r.rTime, r.rNum, t.tName, t.tCategory, t.tLevel, t.tImage, t.cid, c.comName, c.comPocus, r.regDate"
				+ " FROM Reservation r"
				+ " INNER JOIN Theme t ON r.tid = t.tid"
				+ " INNER JOIN Company c ON t.cid = c.cid"
				+ " WHERE uid = ? AND"
				+ " rDate < CURRENT_DATE()"
				+ " ORDER BY rDate DESC";
		return jdbcTemplate.query(sql, new ReserThemeComRowMapper(), uid);
	}
}
