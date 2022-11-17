package com.escape.exiter.theme.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.domain.ThemePrice;
import com.escape.exiter.theme.domain.ThemeReservationTime;

@Repository
public class ThemeDao {
	private JdbcTemplate jdbcTemplate;
	
	public ThemeDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * tid로 테마 정보 찾기
	 * @param tid
	 * @return
	 */
	public Theme findThemeByTid(long tid) {
		String sql = "SELECT * FROM Theme WHERE tid = ?";
		return jdbcTemplate.queryForObject(sql, new ThemeRowMapper(), tid);
	}
	
	/**
	 * tid로 테마가격 찾기
	 * @param tid
	 * @return
	 */
	public List<ThemePrice> findThemePriceByTid(long tid) {
		String sql = "SELECT * FROM ThemePrice WHERE tid = ?";
		return jdbcTemplate.query(sql, new RowMapper<>() {

			@Override
			public ThemePrice mapRow(ResultSet rs, int rowNum) throws SQLException {
				ThemePrice tp = new ThemePrice();
				tp.setTid(rs.getLong("tid"));
				tp.setTpNum(rs.getInt("tpNum"));
				tp.setTPrice(rs.getInt("tPrice"));
				return tp;
			}
			
		}, tid);
	}
	
	public long findTpCntByTid(long tid) {
		String sql = "SELECT COUNT(*) as cnt FROM ThemePrice WHERE tid = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<>() {

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getLong("cnt");
			}
			
		},tid);
	}
	
	public int findTPriceByTidAndTNum(long tid, int tpNum) {
		String sql = "SELECT tPrice FROM ThemePrice WHERE tid = ? AND tpNum = ?";
		return jdbcTemplate.queryForObject(sql, new RowMapper<>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("tPrice");
			}
			
		}, tid, tpNum);
	}
	
	/**
	 * tid로 테마예약시간 찾기
	 * @param tid
	 * @return
	 */
	public List<ThemeReservationTime> findThemeReservationTimeByTid(long tid) {
		String sql = "SELECT * FROM ThemeReservationTime WHERE tid = ?";
		return jdbcTemplate.query(sql, new RowMapper<>() {

			@Override
			public ThemeReservationTime mapRow(ResultSet rs, int rowNum) throws SQLException {
				ThemeReservationTime trt = new ThemeReservationTime();
				trt.setTrid(rs.getLong("trid"));
				trt.setTid(rs.getLong("tid"));
				trt.setTrTime(rs.getString("trTime"));
				return trt;
			}
			
		}, tid);
	}
	
	/**
	 * cid로 company의 다른 테마리스트 조회(현재 조회중인 tid 제외)
	 * @param cid
	 * @return
	 */
	public List<Theme> findThemesByCid(long cid, long tid) {
		String sql = "SELECT tid, tName, tImage FROM Theme WHERE cid = ? AND tid != ?";
		try {
			return jdbcTemplate.query(sql, new RowMapper<>() {

				@Override
				public Theme mapRow(ResultSet rs, int rowNum) throws SQLException {
					Theme t = new Theme();
					t.setTid(rs.getLong("tid"));
					t.setTName(rs.getString("tName"));
					t.setTImage(rs.getString("tImage"));
					return t;
				}
				
			}, cid, tid);
		} catch(Exception e) {
			List<Theme> list = new ArrayList<Theme>();
			return list;
		}
	}
}
