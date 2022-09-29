package com.escape.exiter.search.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.search.domain.SearchThemeCom;
import com.escape.exiter.theme.dao.ThemeRowMapper;
import com.escape.exiter.theme.domain.Theme;

@Repository
public class SearchDao {
private JdbcTemplate jdbcTemplate;
	
	public SearchDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * 테마 검색
	 * @param tName
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByTName(String tName) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE tName LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), "%" + tName + "%");
	}
	
	/**
	 * 매장명, 지점명, 테마이름으로 테마 조회
	 * @param comName
	 * @param comPocus
	 * @param tName
	 * @return
	 */
	public Theme findThemeByCompanyAndTName(String comName, String comPocus, String tName) {
		String sql = "SELECT t.* FROM Theme t INNER JOIN Company c ON t.cid = c.cid"
					+ " WHERE c.comName = ? AND c.comPocus = ? AND t.tName = ?";
		return jdbcTemplate.queryForObject(sql, new ThemeRowMapper(), comName, comPocus, tName);
	}
	
	/**
	 * 매장명, 테마이름으로 테마 조회
	 * @param comName
	 * @param tName
	 * @return
	 */
	public Theme findThemeByCompanyAndTName(String comName, String tName) {
		String sql = "SELECT t.* FROM Theme t INNER JOIN Company c ON t.cid = c.cid"
					+ " WHERE c.comName = ? AND t.tName = ?";
		return jdbcTemplate.queryForObject(sql, new ThemeRowMapper(), comName, tName);
	}
	
}
