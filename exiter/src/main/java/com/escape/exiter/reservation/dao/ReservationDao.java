package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.reservation.domain.ReserDetail;
import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.domain.ReservationDomain;

@Repository
public class ReservationDao {
	private JdbcTemplate jdbcTemplate;
	
	public ReservationDao(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	public void addReservation(ReservationDomain reservation) {
		String sql = "INSERT INTO Reservation(uid, cid, tid, rPrice, rDate, rTime, rNum)"
				+ "VALUES (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, reservation.getUid(),reservation.getCid(),
				reservation.getTid(),reservation.getRPrice(),reservation.getRDate(),
				reservation.getRTime(),reservation.getRNum()+1);
//		System.out.println("[예약 등록]\n" + reservation.toString() + "\n");
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
	
	/**
	 * 오늘 이후 예약목록 조회(오늘자 포함)
	 * @param uid
	 * @return
	 */
	public List<ReserThemeCom> findReservationsAfterToday(long uid) {
		String sql = "SELECT r.rid, r.uid, r.tid, r.rPrice, r.rDate, r.rTime, r.rNum, t.tName, t.tCategory, t.tLevel, t.tImage, t.cid, c.comName, c.comPocus, r.regDate"
				+ " FROM Reservation r"
				+ " INNER JOIN Theme t ON r.tid = t.tid"
				+ " INNER JOIN Company c ON t.cid = c.cid"
				+ " WHERE uid = ? AND rCheck = 'N' AND"
				+ " rDate >= CURRENT_DATE()"
				+ " ORDER BY rDate";
		try {
			return jdbcTemplate.query(sql, new ReserThemeComRowMapper(), uid);
		} catch(Exception e) {
			return null;
		}
	}
	
	/**
	 * 오늘 이전 예약목록 조회
	 * @param uid
	 * @return
	 */
	public List<ReserThemeCom> findReservationsBeforeToday(long uid) {
		String sql = "SELECT r.rid, r.uid, r.tid, r.rPrice, r.rDate, r.rTime, r.rNum, t.tName, t.tCategory, t.tLevel, t.tImage, t.cid, c.comName, c.comPocus, r.regDate"
				+ " FROM Reservation r"
				+ " INNER JOIN Theme t ON r.tid = t.tid"
				+ " INNER JOIN Company c ON t.cid = c.cid"
				+ " WHERE uid = ? AND rCheck = 'N' AND"
				+ " rDate < CURRENT_DATE()"
				+ " ORDER BY rDate DESC";
		try {
			return jdbcTemplate.query(sql, new ReserThemeComRowMapper(), uid);
		} catch(Exception e) {
			return null;
		}
	}
	
	public List<Object> findReservationTime(String rDate, long tid) {
		String sql = "SELECT rTime FROM Reservation r INNER JOIN Theme t ON r.rid = t.tid WHERE r.rDate = ? and r.tid = ?";
		return jdbcTemplate.query(sql, new RowMapper<>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReservationDomain reservationDomain = new ReservationDomain();
				reservationDomain.setRTime(rs.getString("rTime"));
				return reservationDomain.getRTime();
			}
			
		},rDate,tid);
	}
	
	/**
	 * 예약 상세 정보 확인
	 * @param rid
	 * @param uid
	 * @return
	 */
	public ReserDetail findReservationDetail(long rid, long uid) {
		String sql = "SELECT r.rid, r.uid, r.tid, c.cid, r.rPrice, r.rDate, r.rTime, r.rNum, t.tName, t.tCategory, t.tLevel, t.tTime, t.tImage, c.comAddress2, c.comAddress4, c.comName, c.comPocus, c.comTel"
				+ " FROM Reservation r"
				+ " INNER JOIN Theme t ON r.tid = t.tid"
				+ " INNER JOIN Company c ON t.cid = c.cid"
				+ " WHERE rid = ? AND uid = ? AND rCheck = 'N'";
		
		return jdbcTemplate.queryForObject(sql, new ReserDetailRowMapper(), rid, uid);
	}
	
	/**
	 * 예약취소
	 * @param rid
	 * @param uid
	 */
	public void deleteReservation(long rid, long uid) {
		String sql = "UPDATE Reservation SET rCheck = 'Y' WHERE rid = ? AND uid = ?";
		jdbcTemplate.update(sql, rid, uid);
	}
}
