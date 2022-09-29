package com.escape.exiter.theme.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.theme.domain.Theme;

public class ThemeRowMapper implements RowMapper<Theme>{

	@Override
	public Theme mapRow(ResultSet rs, int rowNum) throws SQLException {
		Theme t = new Theme();
		t.setTid(rs.getLong("tid"));
		t.setCid(rs.getLong("cid"));
		t.setTName(rs.getString("tName"));
		t.setTCategory(rs.getString("tCategory"));
		t.setTLevel(rs.getInt("tLevel"));
		t.setTNum(rs.getInt("tNum"));
		t.setTPrice(rs.getInt("tPrice"));
		t.setTDef(rs.getString("tDef"));
		t.setTTime(rs.getInt("tTime"));
		t.setTImage(rs.getString("tImage"));
		t.setRegDate(rs.getTimestamp("regDate"));
		return t;
	}

}
