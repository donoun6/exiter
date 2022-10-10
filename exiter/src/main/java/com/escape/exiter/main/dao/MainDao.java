package com.escape.exiter.main.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MainDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public MainDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
// ====================	main theme image Dao
	public String randomImg() {
		String sql = "SELECT tImage FROM Theme ORDER BY RAND() LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new RowMapper<>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("tImage");
			}
			
		});
	}
}
