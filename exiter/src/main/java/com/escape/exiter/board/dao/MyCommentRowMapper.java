package com.escape.exiter.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.board.domain.MyComment;

public class MyCommentRowMapper implements RowMapper<MyComment> {

	@Override
	public MyComment mapRow(ResultSet rs, int rowNum) throws SQLException {
		MyComment mc = new MyComment();
		mc.setBcid(rs.getLong("bcid"));
		mc.setUid(rs.getLong("uid"));
		mc.setBid(rs.getLong("bid"));
		mc.setCid(rs.getLong("cid"));
		mc.setBcDef(rs.getString("bcDef"));
		// 오늘과 날짜 비교
		Date today = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(format1.format(today).equals(format1.format(rs.getDate("regDate")))) {
			// 게시글 날짜가 오늘이라면 시간만 출력
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			mc.setBTime(format.format(rs.getTimestamp("regDate")));
		} else {
			// 아니라면 날짜 출력
			mc.setRegDate(rs.getDate("regDate"));
		}
		mc.setBTitle(rs.getString("bTitle"));
		mc.setBCategory(rs.getString("bCategory"));
		return mc;
	}

}
