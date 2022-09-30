package com.escape.exiter.theme.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.theme.domain.Theme;

@Repository
public class ThemeDao {
	private JdbcTemplate jdbcTemplate;
	
	public ThemeDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Theme findThemeByTid(long tid) {
		String sql = "SELECT * FROM Theme WHERE tid = ?";
		return jdbcTemplate.queryForObject(sql, new ThemeRowMapper(), tid);
	}
}
