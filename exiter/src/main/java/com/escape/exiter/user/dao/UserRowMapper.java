package com.escape.exiter.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.user.domain.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setUid(rs.getLong("uid"));
		u.setUserId(rs.getString("userId"));
		u.setUPasswd(rs.getString("uPasswd"));
		u.setUName(rs.getString("uName"));
		u.setUPhone(rs.getString("uPhone"));
		u.setUGrade(rs.getString("uGrade"));
		u.setUType(rs.getString("uType").charAt(0));
		u.setUCheck(rs.getBoolean("uCheck"));
		u.setRegDate(rs.getDate("regDate"));
		return u;
	}
	
}
