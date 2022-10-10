package com.escape.exiter.main.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.main.domain.MainDomain;

public class MainDao {
	private JdbcTemplate jdbcTemplate;
	
//	JDBC Data
	public MainDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
// ====================	main theme image Dao
//	랜덤이미지 1개 출력
	public String randomImg() {
		String sql = "SELECT tImage FROM Theme ORDER BY RAND() LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new RowMapper<>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("tImage");
			}
			
		});
	}
	
//	최신 등록 이미지 출력
	public List<MainDomain> newImg() {
		String sql = "SELECT tImage,tName,comName FROM Theme t INNER JOIN Company c ON t.cid = c.cid ORDER BY tid DESC";
		return jdbcTemplate.query(sql, new RowMapper<>() {

			@Override
			public MainDomain mapRow(ResultSet rs, int rowNum) throws SQLException {
				MainDomain md = new MainDomain();
				md.setTImage(rs.getString("tImage"));
				md.setTName(rs.getString("tName"));
				md.setComName(rs.getString("comName"));
				return md;
			}
			
		});
	}
}
