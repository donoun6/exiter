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
	 * 모든 테마 검색
	 * @return
	 */
	public List<SearchThemeCom> findThemeList() {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper());
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
	
	/**
	 * 지역1 선택하여 테마 조회1
	 * @param city
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCity(String city) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city + "%");
	}
	
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%");
	}
	
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2, String city3) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%");
	}
	
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2, String city3, String city4) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%", city4 + "%");
	}
}
