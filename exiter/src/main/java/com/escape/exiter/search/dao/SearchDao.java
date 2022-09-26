package com.escape.exiter.search.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.escape.exiter.search.domain.SearchThemeCom;

@Repository
public class SearchDao {
private JdbcTemplate jdbcTemplate;
	
	public SearchDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<SearchThemeCom> findThemeListByTName(String tName) {
		String sql = "SELECT c.comName, c.comPocus, t.tName, t.tImage FROM Theme t"
					+ " INNER JOIN Company c ON t.cid = c.cid WHERE tName LIKE ?";
		return jdbcTemplate.query(sql, new SearchThemeRowMapper(), "%" + tName + "%");
	}
}
