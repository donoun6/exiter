package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		// 오늘과 날짜 비교
		Date today = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(format1.format(today).equals(format1.format(rs.getDate("regDate")))) {
			// 게시글 날짜가 오늘이라면 시간만 출력
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			mb.setBTime(format.format(rs.getTimestamp("regDate")));
		} else {
			// 아니라면 날짜 출력
			mb.setRegDate(rs.getDate("regDate"));
		}
		mb.setUserId(rs.getString("userId"));
		mb.setUGrade(rs.getString("uGrade"));
		return mb;
	}

}
