package com.escape.exiter.theme.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.escape.exiter.search.dao.SearchThemeRowMapper;
import com.escape.exiter.search.domain.SearchThemeCom;

@Repository
public class ThemeDao {
	private JdbcTemplate jdbcTemplate;
	
	public ThemeDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
}
