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
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
				+ " INNER JOIN Company c ON t.cid = c.cid";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper());
	}
	
	/**
	 * 테마 검색
	 * @param tName
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByTName(String tName) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
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
	public List<SearchThemeCom> findThemeListByCity(String city, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city + "%", tCategory);
		}
	}
	
	/**
	 * 지역1 선택하여 테마 조회2
	 * @param city1
	 * @param city2
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE (comAddress3 LIKE ? OR comAddress3 LIKE ?) AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", tCategory);
		}
	}
	
	/**
	 * 지역1 선택하여 테마 조회3
	 * @param city1
	 * @param city2
	 * @param city3
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2, String city3, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE (comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?) AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%", tCategory);
		}
	}
	
	/**
	 * 지역1 선택하여 테마 조회4
	 * @param city1
	 * @param city2
	 * @param city34
	 * @param city
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCity(String city1, String city2, String city3, String city4, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%", city4 + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE (comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ? OR comAddress3 LIKE ?) AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", city2 + "%", city3 + "%", city4 + "%", tCategory);
		}
	}
	
	/**
	 * 지역 및 장르 선택하여 테마 조회1
	 * @param city
	 * @param tCategory
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCountyAndGenre(String city, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city + "%", tCategory);
		}
	}
	
	/**
	 * 지역 및 장르 선택하여 테마 조회2
	 * @param city1
	 * @param city2
	 * @param tCategory
	 * @return
	 */
	public List<SearchThemeCom> findThemeListByCountyAndGenre(String city1, String city2, String tCategory) {
		if(tCategory.equals("전체") || tCategory.equals("기타")) { //tCategory.equals("전체") || tCategory.equals("기타")
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? AND comAddress3 Like ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", "%" + city2 + "%");
		} else {
			String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage, t.tCategory FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE comAddress3 LIKE ? AND comAddress3 Like ? AND tCategory = ?";
			return jdbcTemplate.query(sql, new SearchThemeRowMapper(), city1 + "%", "%" + city2 + "%", tCategory);
		}
	}
}
