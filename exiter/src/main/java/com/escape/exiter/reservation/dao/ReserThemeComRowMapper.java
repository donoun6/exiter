package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.reservation.domain.ReserThemeCom;
import com.escape.exiter.reservation.domain.ReservationDomain;

public class ReserThemeComRowMapper implements RowMapper<ReserThemeCom>{

	@Override
	public ReserThemeCom mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReserThemeCom reser = new ReserThemeCom();
		reser.setRid(rs.getLong("rid"));
		reser.setUid(rs.getLong("uid"));
		reser.setTid(rs.getLong("tid"));
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String tPrice = decFormat.format(rs.getInt("rPrice"));
		reser.setRPrice(tPrice);
		reser.setRDate(rs.getString("rDate"));
		reser.setRTime(rs.getString("rTime"));
		reser.setRNum(rs.getInt("rNum"));
		reser.setTName(rs.getString("tName"));
		reser.setTCategory(rs.getString("tCategory"));
		reser.setTLevel(rs.getInt("tLevel"));
		reser.setTImage(rs.getString("tImage"));
		reser.setCid(rs.getLong("cid"));
		reser.setComName(rs.getString("comName"));
		reser.setComPocus(rs.getString("comPocus"));
		reser.setRegDate(rs.getTimestamp("regDate"));
		return reser;
	}

}
