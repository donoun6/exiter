package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.board.domain.MyBoard;

public class MyBoardRowMapper implements RowMapper<MyBoard> {

	@Override
	public MyBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
		MyBoard mb = new MyBoard();
		mb.setBid(rs.getLong("bid"));
		mb.setUid(rs.getLong("uid"));
		mb.setCid(rs.getLong("cid"));
		mb.setBTitle(rs.getString("bTitle"));
		mb.setBDef(rs.getString("bDef"));
		mb.setBCategory(rs.getString("bCategory"));
		mb.setBcCheck(rs.getInt("bcCheck"));
		mb.setRegDate(rs.getDate("regDate"));
		mb.setUserId(rs.getString("userId"));
		mb.setUGrade(rs.getString("uGrade"));
		return mb;
	}

}
