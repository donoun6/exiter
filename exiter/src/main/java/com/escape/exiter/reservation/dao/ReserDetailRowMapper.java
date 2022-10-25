package com.escape.exiter.reservation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import org.springframework.jdbc.core.RowMapper;

import com.escape.exiter.reservation.domain.ReserDetail;

public class ReserDetailRowMapper implements RowMapper<ReserDetail>{

	@Override
	public ReserDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReserDetail rd = new ReserDetail();
		rd.setRid(rs.getLong("rid"));
		rd.setUid(rs.getLong("uid"));
		rd.setTid(rs.getLong("tid"));
		rd.setCid(rs.getLong("cid"));
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String rPrice = decFormat.format(rs.getInt("rPrice"));
		rd.setRPrice(rPrice);
		rd.setRDate(rs.getString("rDate"));
		rd.setRTime(rs.getString("rTime"));
		rd.setRNum(rs.getInt("rNum"));
		rd.setTName(rs.getString("tName"));
		rd.setTCategory(rs.getString("tCategory"));
		rd.setTLevel(rs.getInt("tLevel"));
		rd.setTTime(rs.getInt("tTime"));
		rd.setTImage(rs.getString("tImage"));
		rd.setComAddress2(rs.getString("comAddress2"));
		rd.setComAddress4(rs.getString("comAddress4"));
		rd.setComName(rs.getString("comName"));
		rd.setComPocus(rs.getString("comPocus"));
		rd.setComTel(rs.getString("comTel"));
		return rd;
	}

}
