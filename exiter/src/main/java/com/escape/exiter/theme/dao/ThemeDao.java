package com.escape.exiter.theme.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.theme.domain.Theme;
import com.escape.exiter.theme.domain.ThemePrice;

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
}
